import 'package:flutter/material.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';
import 'package:tasks_app_acl/widgets/pages/AddTask.dart';
import 'package:tasks_app_acl/widgets/pages/Settings.dart';
import 'package:tasks_app_acl/widgets/TaskList.dart';
import 'package:tasks_app_acl/widgets/partials/buildDrawer.dart';

class Home extends StatelessWidget {
  const Home(this._taskProvider);

  final TaskProvider _taskProvider;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Tasks"),
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.watch_later),
            text: "To do",
          ),
          Tab(
            icon: Icon(Icons.engineering),
            text: "In progress",
          ),
          Tab(
            icon: Icon(Icons.check),
            text: "Done",
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
        TaskList(TaskState.TO_DO, _taskProvider),
        TaskList(TaskState.IN_PROGRESS, _taskProvider),
        TaskList(TaskState.DONE, _taskProvider),
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
      child: Icon(Icons.add),
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
