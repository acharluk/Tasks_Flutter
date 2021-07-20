import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';
import 'package:tasks_app_acl/widgets/partials/buildTaskPopup.dart';

class TaskList extends StatelessWidget {
  const TaskList(this.state);
  final int state;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskList, child) {
        final tasks = taskList.getTasks(state: state);

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].title),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (builder) {
                    return buildTaskPopup(context, tasks[index]);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
