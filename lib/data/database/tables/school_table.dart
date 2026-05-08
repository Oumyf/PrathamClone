import 'package:drift/drift.dart';

class SchoolTable extends Table {
  TextColumn get schoolId => text()();
  TextColumn get schoolName => text()();
  TextColumn get instituteId => text()();
  IntColumn get pushFlag => integer().withDefault(const Constant(1))();
  TextColumn get createdDate => text().nullable()();
  TextColumn get createdBy => text().nullable()();

  @override
  Set<Column> get primaryKey => {schoolId};
}
