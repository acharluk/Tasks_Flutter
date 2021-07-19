import 'package:flutter/material.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';

class TaskList extends StatelessWidget {
  const TaskList(this.state, this.taskProvider);
  final int state;
  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(taskProvider.getTasks()[0].title),
    );
  }
}
