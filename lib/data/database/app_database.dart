import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pratham_clone/data/database/tables/aser_tool_answers_table.dart';
import 'package:pratham_clone/data/database/tables/aser_tool_table.dart';
import 'package:pratham_clone/data/database/tables/crl_table.dart';
import 'package:pratham_clone/data/database/tables/institute_table.dart';
import 'package:pratham_clone/data/database/tables/municipality_table.dart';
import 'package:pratham_clone/data/database/tables/school_table.dart';
import 'package:pratham_clone/data/database/tables/child_survey_table.dart';
import 'package:pratham_clone/data/database/tables/student_session_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  CrlTable,
  MunicipalityTable,
  InstituteTable,
  SchoolTable,
  ChildSurveyTable,
  AserToolTable,
  AserToolAnswersTable,
  StudentSessionTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) await m.createTable(municipalityTable);
          if (from < 3) await m.createTable(instituteTable);
          if (from < 4) await m.createTable(schoolTable);
          if (from < 5) await m.createTable(childSurveyTable);
          if (from < 6) await m.createTable(aserToolTable);
          if (from < 7) await m.createTable(aserToolAnswersTable);
          if (from < 8) await m.createTable(studentSessionTable);
        },
      );
      

  Future<CrlTableData?> checkCredentials(String userName, String password) {
    return (select(crlTable)
          ..where((row) =>
              row.userName.equals(userName) & row.password.equals(password)))
        .getSingleOrNull();
  }

  Future<void> insertCrl(CrlTableCompanion crl) {
    return into(crlTable).insertOnConflictUpdate(crl);
  }

    Future<List<MunicipalityTableData>> getAllMunicipalities() {
    return (select(municipalityTable)
          ..orderBy([(m) => OrderingTerm.asc(m.municipalityName)]))
        .get();
  }

  Future<void> insertMunicipality(MunicipalityTableCompanion municipality) {
    return into(municipalityTable).insertOnConflictUpdate(municipality);
  }

  Future<List<InstituteTableData>> getInstitutesByMunicipality(String municipalityId) {
    return (select(instituteTable)
          ..where((i) => i.municipalityId.equals(municipalityId))
          ..orderBy([(i) => OrderingTerm.asc(i.instituteName)]))
        .get();
  }

  Future<void> insertInstitute(InstituteTableCompanion institute) {
    return into(instituteTable).insertOnConflictUpdate(institute);
  }

    Future<List<SchoolTableData>> getSchoolsByInstitute(String instituteId) {
    return (select(schoolTable)
          ..where((s) => s.instituteId.equals(instituteId))
          ..orderBy([(s) => OrderingTerm.asc(s.schoolName)]))
        .get();
  }

  Future<void> insertSchool(SchoolTableCompanion school) {
    return into(schoolTable).insertOnConflictUpdate(school);
  }

   Future<void> insertStudent(ChildSurveyTableCompanion student) {
    return into(childSurveyTable).insertOnConflictUpdate(student);
  }

    Future<List<ChildSurveyTableData>> getStudentsBySchool(String schoolId) {
    return (select(childSurveyTable)
          ..where((s) => s.schoolId.equals(schoolId))
          ..orderBy([(s) => OrderingTerm.asc(s.studentName)]))
        .get();
  }

  Future<void> seedTestUser() {
    return insertCrl(const CrlTableCompanion(
      crlId: Value('test-001'),
      userName: Value('admin'),
      password: Value('1234'),
      firstName: Value('Test'),
      lastName: Value('User'),
      roleName: Value('CRL'),
    ));
  }

  Future<List<String>> getDistinctLanguages() async {
    final query = selectOnly(aserToolTable, distinct: true)
      ..addColumns([aserToolTable.language]);
    final rows = await query.get();
    return rows.map((r) => r.read(aserToolTable.language)!).toList();
  }

  // AserTool methods
  Future<void> insertAserTool(AserToolTableCompanion item) {
    return into(aserToolTable).insertOnConflictUpdate(item);
  }

  Future<List<AserToolTableData>> getAserToolItems(
      String type, String language, int limit) {
    return (select(aserToolTable)
          ..where((t) =>
              t.type.equals(type) &
              t.language.equals(language) &
              t.isAttempted.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.sampleNumber)])
          ..limit(limit))
        .get();
  }

  Future<void> markAserToolAttempted(String id) {
    return (update(aserToolTable)..where((t) => t.id.equals(id)))
        .write(const AserToolTableCompanion(isAttempted: Value(true)));
  }

  Future<void> resetAserToolAttempted(String type, String language) {
    return (update(aserToolTable)
          ..where((t) => t.type.equals(type) & t.language.equals(language)))
        .write(const AserToolTableCompanion(isAttempted: Value(false)));
  }

  Future<bool> hasAserToolData() async {
    final result = await (select(aserToolTable)..limit(1)).get();
    return result.isNotEmpty;
  }

  // AserToolAnswers methods
  Future<void> insertAserToolAnswer(AserToolAnswersTableCompanion answer) {
    return into(aserToolAnswersTable).insert(answer);
  }

  Future<List<AserToolAnswersTableData>> getAnswersByExam(
      String examId, String type) {
    return (select(aserToolAnswersTable)
          ..where(
              (a) => a.examId.equals(examId) & a.type.equals(type)))
        .get();
  }

  Future<void> updateGrade(int answerId, int grade) {
    return (update(aserToolAnswersTable)
          ..where((a) => a.id.equals(answerId)))
        .write(AserToolAnswersTableCompanion(grade: Value(grade)));
  }

  // StudentSession methods
  Future<void> insertSession(StudentSessionTableCompanion session) {
    return into(studentSessionTable).insertOnConflictUpdate(session);
  }

  Future<StudentSessionTableData?> getSession(String examId) {
    return (select(studentSessionTable)
          ..where((s) => s.examId.equals(examId)))
        .getSingleOrNull();
  }

  Future<void> updateSessionEnd(String examId, String endTime,
      String proficiency) {
    return (update(studentSessionTable)
          ..where((s) => s.examId.equals(examId)))
        .write(StudentSessionTableCompanion(
          endTime: Value(endTime),
          proficiency: Value(proficiency),
        ));
  }

  Future<List<StudentSessionTableData>> getAllSessions() {
    return (select(studentSessionTable)
          ..orderBy([(s) => OrderingTerm.desc(s.startTime)]))
        .get();
  }

  Future<List<StudentSessionTableData>> getNotPushedSessions() {
    return (select(studentSessionTable)
          ..where((s) => s.isPushed.equals(false) & s.endTime.isNotNull())
          ..orderBy([(s) => OrderingTerm.desc(s.startTime)]))
        .get();
  }

  Future<void> markSessionPushed(String examId) {
    return (update(studentSessionTable)
          ..where((s) => s.examId.equals(examId)))
        .write(const StudentSessionTableCompanion(isPushed: Value(true)));
  }

  Future<List<AserToolAnswersTableData>> getAnswersByExamAll(String examId) {
    return (select(aserToolAnswersTable)
          ..where((a) => a.examId.equals(examId)))
        .get();
  }

  Future<ChildSurveyTableData?> getStudentById(String studentId) {
    return (select(childSurveyTable)
          ..where((s) => s.studentId.equals(studentId)))
        .getSingleOrNull();
  }

  // Retourne {correct, total} pour une session
  Future<Map<String, int>> getSessionStats(String examId) async {
    final answers = await (select(aserToolAnswersTable)
          ..where((a) => a.examId.equals(examId) & a.isAttempted.equals(true)))
        .get();
    final correct = answers.where((a) => a.grade == 2).length;
    return {'correct': correct, 'total': answers.length};
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'readnet.db'));
    return NativeDatabase.createInBackground(file);
  });
}
