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
        List<Map> tasks = await db.query(
          'tasks',
          columns: [
            'id',
            'title',
            'description',
            'state',
          ],
        );

        _tasks.addAll(
          tasks.map(
            (t) => Task(
              id: t['id'],
              title: t['title'],
              description: t['description'],
              state: t['state'],
            ),
          ),
        );

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
    int id = await _db.transaction(
      (txn) async {
        int id = await txn.insert(
          'tasks',
          {
            'title': title,
            'description': description,
            'state': TaskState.TO_DO,
          },
        );
        return id;
      },
    );

    final task = Task(id: id, title: title, description: description);
    _tasks.add(task);

    notifyListeners();

    return task;
  }

  Future<void> moveToNextStep(Task task) async {
    await _db.update(
      'tasks',
      {
        'state': ++task.state,
      },
      where: 'id = ?',
      whereArgs: [
        task.id,
      ],
    );

    notifyListeners();
  }

  Future<void> moveToPreviousStep(Task task) async {
    await _db.update(
      'tasks',
      {
        'state': --task.state,
      },
      where: 'id = ?',
      whereArgs: [
        task.id,
      ],
    );

    notifyListeners();
  }

  Future<void> delete(Task task) async {
    _db.delete(
      'tasks',
      where: 'title = ?',
      whereArgs: [
        task.title,
      ],
    );

    _tasks.remove(task);

    notifyListeners();
  }
}
