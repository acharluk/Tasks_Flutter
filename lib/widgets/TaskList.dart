import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList(this.state);
  final int state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Task state: " + state.toString()),
    );
  }
}
