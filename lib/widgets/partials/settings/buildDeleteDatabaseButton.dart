import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';

ListTile buildDeleteDatabaseButton(BuildContext context) {
  return ListTile(
    title: Row(
      children: [
        Icon(
          FontAwesome5.trash_alt,
          color: Colors.red,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Delete database"),
        )
      ],
    ),
    onTap: () async {
      await Provider.of<TaskProvider>(
        context,
        listen: false,
      ).deleteAll();

      Navigator.pop(context);
    },
  );
}
