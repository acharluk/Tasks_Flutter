import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';

ListTile buildImportDatabaseButton(BuildContext context) {
  return ListTile(
    title: Row(
      children: [
        Icon(FontAwesome5.download),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Import database"),
        )
      ],
    ),
    onTap: () async {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'tasks_acl.sqlite');

      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path ?? "");
        file.copySync(path);
        await Provider.of<TaskProvider>(context, listen: false).reload();
      } else {
        // TODO: Handle null result
      }

      Navigator.pop(context);
    },
  );
}
