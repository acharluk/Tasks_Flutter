import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks_app_acl/models/Task.dart';

class TaskProvider extends ChangeNotifier {
  late final Database _db;

  TaskProvider() {
    _openDB();
  }

  _openDB() async {
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
      onOpen: (Database db) async {
        print("Database opened!");
        notifyListeners();
      },
    );
  }

  List<Task> getTasks() {
    return [
      Task(title: 'Test task', description: 'This is a test task'),
    ];
  }

  Future<Task> createTask(String title, String description) async {
    // var task = await _db!.insert(
    //   'tasks',
    //   {
    //     title: title,
    //     description: description,
    //   },
    // );

    // print(task);
    return Task(title: title, description: description);
  }
}
