import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';
import 'package:tasks_app_acl/widgets/TaskList.dart';
import 'package:tasks_app_acl/widgets/pages/AddTask.dart';
import 'package:tasks_app_acl/widgets/pages/Settings.dart';
import 'package:tasks_app_acl/widgets/partials/buildDrawer.dart';

class Home extends StatelessWidget {
  const Home();

  AppBar buildAppBar(BuildContext context) {
    precacheImage(AssetImage('resources/drawer_header.jpg'), context);

    return AppBar(
      title: Text("Tasks"),
      elevation: 15,
      bottom: TabBar(
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.watch_later),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("To do"),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.engineering),
                Padding(padding: EdgeInsets.all(1.0)),
                Text("In progress"),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Done"),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              child: Icon(
                Icons.settings,
                size: 26.0,
              ),
            )),
      ],
    );
  }

  TabBarView buildBody() {
    return TabBarView(
      children: [
        TaskList(TaskState.TO_DO),
        TaskList(TaskState.IN_PROGRESS),
        TaskList(TaskState.DONE),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTask(),
          ),
        );
      },
      child: Icon(FontAwesome5.plus),
      tooltip: "New task",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: buildBody(),
          floatingActionButton: buildFloatingActionButton(context),
          drawer: buildDrawer(),
        ),
      ),
    );
  }
}
