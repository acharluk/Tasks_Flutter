import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks_app_acl/models/Task.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';

class TaskProvider extends ChangeNotifier {
  late final Database _db;
  final List<Task> _tasks;

  TaskProvider() : _tasks = [] {
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
        final tasks = await db.query('tasks');
        tasks.forEach((task) {
          _tasks.add(
            Task(
              title: task['title'].toString(),
              description: task['description'].toString(),
            ),
          );
        });
        notifyListeners();
      },
    );
  }

  List<Task> getTasks({int? state}) {
    if (state == null) {
      return _tasks;
    }

    return _tasks.where((element) => element.state == state).toList();
  }

  Future<Task> createTask(String title, String description) async {
    await _db.transaction(
      (txn) async {
        txn.insert(
          'tasks',
          {
            'title': title,
            'description': description,
            'state': TaskState.TO_DO,
          },
        );
      },
    );

    final task = Task(title: title, description: description);
    _tasks.add(task);

    notifyListeners();

    return task;
  }

  Future<void> moveToNextStep(Task task) async {
    switch (task.state) {
      case TaskState.TO_DO:
      case TaskState.IN_PROGRESS:
        await _db.update(
          'tasks',
          {
            'state': ++task.state,
          },
          where: 'title = ?',
          whereArgs: [
            task.title,
          ],
        );
        break;
      case TaskState.DONE:
        await delete(task);
    }

    // print(getTasks());

    notifyListeners();
  }

  Future<void> delete(Task task) async {}
}
