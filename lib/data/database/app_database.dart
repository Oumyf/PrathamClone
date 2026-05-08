import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pratham_clone/data/database/tables/crl_table.dart';
import 'package:pratham_clone/data/database/tables/institute_table.dart';
import 'package:pratham_clone/data/database/tables/municipality_table.dart';
import 'package:pratham_clone/data/database/tables/school_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CrlTable, MunicipalityTable, InstituteTable, SchoolTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) await m.createTable(municipalityTable);
          if (from < 3) await m.createTable(instituteTable);
          if (from < 4) await m.createTable(schoolTable);
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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'readnet.db'));
    return NativeDatabase.createInBackground(file);
  });
}
