import 'package:drift/drift.dart';

class CrlTable extends Table {
  TextColumn get crlId => text()();
  TextColumn get roleId => text().nullable()();
  TextColumn get roleName => text().nullable()();
  TextColumn get programId => text().nullable()();
  TextColumn get programName => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get block => text().nullable()();
  TextColumn get district => text().nullable()();
  TextColumn get userName => text().nullable()();
  TextColumn get password => text().nullable()();

  @override
  Set<Column> get primaryKey => {crlId};
}
