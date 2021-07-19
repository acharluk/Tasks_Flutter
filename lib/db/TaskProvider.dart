import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks_app_acl/models/Task.dart';

class TaskProvider {
  late final Database _db;

  TaskProvider() {
    openDB();
  }

  Future<void> openDB() async {
    final databasesPath = await getDatabasesPath();
    _db = await openDatabase(
      join(databasesPath, 'tasks_acl.sqlite'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""CREATE TABLE tasks(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              title VARCHAR(100),
                              description TEXT,
                              state INTEGER(2)
                            );""");
      },
      onOpen: (Database db) {
        print("Database opened!");
      },
    );
  }

  List<Task> getTasks() {
    return [
      Task(title: 'Test task', description: 'This is a test task'),
    ];
  }
}
