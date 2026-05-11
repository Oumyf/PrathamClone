import 'package:drift/drift.dart';

class AserToolAnswersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get examId => text()();
  TextColumn get queId => text()();
  TextColumn get queText => text()();
  TextColumn get type => text()();
  IntColumn get sampleNumber => integer().withDefault(const Constant(1))();
  // -1 = not attempted, 1 = wrong, 2 = correct, 9 = no answer
  IntColumn get grade => integer().withDefault(const Constant(-1))();
  BoolColumn get isAttempted => boolean().withDefault(const Constant(false))();
  TextColumn get recordingName => text().nullable()();
}
