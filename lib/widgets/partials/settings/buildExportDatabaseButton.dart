import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';

ListTile buildExportDatabaseButton(BuildContext context) {
  return ListTile(
    title: Row(
      children: [
        Icon(FontAwesome5.upload),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Export database"),
        )
      ],
    ),
    onTap: () async {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'tasks_acl.sqlite');
      await Share.shareFiles([path]);

      Navigator.pop(context);
    },
  );
}
