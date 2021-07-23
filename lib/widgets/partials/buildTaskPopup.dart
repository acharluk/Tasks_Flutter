import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';
import 'package:tasks_app_acl/models/Task.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';

SimpleDialog buildTaskPopup(BuildContext context, Task task) {
  String nextStep =
      task.state == TaskState.TO_DO ? "Move to in progress" : "Move to done";
  String previousStep =
      task.state == TaskState.DONE ? "Move to in progress" : "Move to to do";

  return SimpleDialog(
    title: Text(task.title),
    children: [
      task.state <= TaskState.IN_PROGRESS
          ? SimpleDialogOption(
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
            )
          : Container(),
      task.state >= TaskState.IN_PROGRESS
          ? SimpleDialogOption(
              onPressed: () async {
                await Provider.of<TaskProvider>(
                  context,
                  listen: false,
                ).moveToPreviousStep(task);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(FontAwesome5.arrow_alt_circle_left),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(previousStep),
                  )
                ],
              ),
            )
          : Container(),
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
