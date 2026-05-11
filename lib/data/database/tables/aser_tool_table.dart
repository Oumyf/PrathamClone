import 'package:drift/drift.dart';

class AserToolTable extends Table {
  TextColumn get id => text()();
  TextColumn get data => text()();
  TextColumn get type => text()();
  TextColumn get language => text()();
  IntColumn get sampleNumber => integer().withDefault(const Constant(1))();
  TextColumn get year => text().withDefault(const Constant('2024'))();
  BoolColumn get isAttempted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
