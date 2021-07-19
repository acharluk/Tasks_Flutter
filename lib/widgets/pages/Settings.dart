import 'package:flutter/material.dart';
import 'package:path/path.dart';

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
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.warning),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Delete database"),
                  )
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
