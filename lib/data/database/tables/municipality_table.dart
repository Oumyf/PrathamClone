import 'package:drift/drift.dart';

class MunicipalityTable extends Table {
  TextColumn get municipalityId => text()();
  TextColumn get municipalityName => text()();
  TextColumn get departmentId => text().nullable()();

  @override
  Set<Column> get primaryKey => {municipalityId};
}
