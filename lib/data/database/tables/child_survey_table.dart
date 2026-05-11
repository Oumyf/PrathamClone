import 'package:drift/drift.dart';

class ChildSurveyTable extends Table {
  TextColumn get studentId => text()();
  TextColumn get studentName => text()();
  TextColumn get age => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get instituteId => text().nullable()();
  TextColumn get schoolId => text()();
  IntColumn get pushFlag => integer().withDefault(const Constant(1))();
  TextColumn get createdDate => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  BoolColumn get isTestCompleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {studentId};
}
