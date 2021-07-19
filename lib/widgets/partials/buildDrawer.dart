import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:url_launcher/url_launcher.dart';

DrawerHeader _buildDrawerHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('resources/drawer_header.jpg'))),
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text(
            "Tasks",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}

Drawer buildDrawer() {
  return Drawer(
    child: ListView(
      children: [
        _buildDrawerHeader(),
        ListTile(
          title: Row(
            children: [
              Icon(FontAwesome5.github),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("GitHub Repository"),
              )
            ],
          ),
          onTap: () async {
            const REPO_URL = "https://github.com/acharluk/Tasks_Flutter";
            if (await canLaunch(REPO_URL)) {
              await launch(REPO_URL);
            } else {
              // Error screen :(
              print("Something went wrong :(");
            }
          },
        ),
        ListTile(
          title: Row(
            children: [
              Icon(Icons.report_sharp),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("DO NOT TOUCH"),
              )
            ],
          ),
          onTap: () {
            exit(-1);
          },
        ),
      ],
    ),
  );
}
