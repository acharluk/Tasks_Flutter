import 'package:flutter/material.dart';
import 'package:tasks_app_acl/widgets/partials/settings/buildDeleteDatabaseButton.dart';
import 'package:tasks_app_acl/widgets/partials/settings/buildExportDatabaseButton.dart';
import 'package:tasks_app_acl/widgets/partials/settings/buildImportDatabaseButton.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "General",
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            buildExportDatabaseButton(context),
            buildImportDatabaseButton(context),
            buildDeleteDatabaseButton(context),
          ],
        ),
      ),
    );
  }
}
