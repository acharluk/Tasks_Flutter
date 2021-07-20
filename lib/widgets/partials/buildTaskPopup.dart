import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';
import 'package:tasks_app_acl/models/Task.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';

SimpleDialog buildTaskPopup(BuildContext context, Task task) {
  String nextStep =
      task.state == TaskState.TO_DO ? "Move to in progress" : "Move to done";

  return SimpleDialog(
    title: Text(task.title),
    children: [
      Padding(
        padding: EdgeInsets.all(26.0),
        child: Text(task.description),
      ),
      SimpleDialogOption(
        onPressed: () async {
          await Provider.of<TaskProvider>(
            context,
            listen: false,
          ).moveToNextStep(task);
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(FontAwesome5.arrow_alt_circle_right),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(nextStep),
            )
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Provider.of<TaskProvider>(
            context,
            listen: false,
          ).delete(task);
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(FontAwesome5.trash),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Remove"),
            )
          ],
        ),
      ),
    ],
  );
}
