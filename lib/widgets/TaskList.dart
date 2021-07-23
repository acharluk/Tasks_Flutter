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
            return GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (builder) {
                      return buildTaskPopup(context, tasks[index]);
                    },
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 25,
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ExpansionTile(
                      title: Text(tasks[index].title),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(tasks[index].title),
                        ),
                      ],
                    ),
                  ),
                ));
            // return ListTile(
            //   title: Text(tasks[index].title),
            //   onTap: () {
            //     showDialog(
            //       context: context,
            //       builder: (builder) {
            //         return buildTaskPopup(context, tasks[index]);
            //       },
            //     );
            //   },
            // );
          },
        );
      },
    );
  }
}
