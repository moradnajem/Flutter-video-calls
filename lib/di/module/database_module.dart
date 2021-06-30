import 'package:configuration/di/di_module.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:configuration/data/common/database_table.dart';

class DatabaseModule extends DIModule {
  static const VERSION = 1;

  @override
  provides() async {
    // Open the database and store the reference.
    final database = await openDatabase(
      join(await getDatabasesPath(), 'okila_database.db'),
      onCreate: (db, version) async {
        Batch batch = db.batch();
        batch.execute("DROP TABLE IF EXISTS $ACCOUNT_TABLE ;");
        batch.execute(ACCOUNT_QUERY);
        await batch.commit();
      },
      version: VERSION,
    );
    getIt.registerSingleton(database);
  }
}
