import 'package:drift/drift.dart';

class InstituteTable extends Table {
  TextColumn get instituteId => text()();
  TextColumn get instituteName => text()();
  TextColumn get municipalityId => text()();
  IntColumn get pushFlag => integer().withDefault(const Constant(1))();
  TextColumn get createdDate => text().nullable()();
  TextColumn get createdBy => text().nullable()();

  @override
  Set<Column> get primaryKey => {instituteId};
}
