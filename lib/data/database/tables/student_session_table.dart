import 'package:drift/drift.dart';

class StudentSessionTable extends Table {
  TextColumn get examId => text()();
  TextColumn get studId => text()();
  TextColumn get crlId => text()();
  IntColumn get sampleNumber => integer().withDefault(const Constant(1))();
  TextColumn get startTime => text()();
  TextColumn get endTime => text().nullable()();
  TextColumn get childFullName => text()();
  TextColumn get language => text()();
  TextColumn get proficiency => text().nullable()();
  BoolColumn get isPushed => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {examId};
}
