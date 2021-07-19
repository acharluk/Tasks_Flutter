import 'package:flutter/material.dart';
import 'package:tasks_app_acl/utils/TaskState.dart';
import 'package:tasks_app_acl/widgets/TaskList.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
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
          ),
          body: TabBarView(
            children: [
              TaskList(TaskState.TO_DO),
              TaskList(TaskState.IN_PROGRESS),
              TaskList(TaskState.DONE),
            ],
          ),
        ),
      ),
    );
  }
}
