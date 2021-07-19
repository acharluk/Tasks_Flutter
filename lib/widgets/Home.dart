import 'package:flutter/material.dart';
import 'package:tasks_app_acl/db/TaskProvider.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';
import 'package:tasks_app_acl/widgets/TaskList.dart';
import 'package:tasks_app_acl/widgets/partials/buildDrawer.dart';

class Home extends StatelessWidget {
  const Home(this._taskProvider);

  final TaskProvider _taskProvider;

  AppBar buildAppBar() {
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

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Add task view
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
          appBar: buildAppBar(),
          body: buildBody(),
          floatingActionButton: buildFloatingActionButton(),
          drawer: buildDrawer(),
        ),
      ),
    );
  }
}
