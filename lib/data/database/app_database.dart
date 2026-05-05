import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pratham_clone/data/database/tables/crl_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CrlTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<CrlTableData?> checkCredentials(String userName, String password) {
    return (select(crlTable)
          ..where((row) =>
              row.userName.equals(userName) & row.password.equals(password)))
        .getSingleOrNull();
  }

  Future<void> insertCrl(CrlTableCompanion crl) {
    return into(crlTable).insertOnConflictUpdate(crl);
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
