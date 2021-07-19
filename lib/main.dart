import 'package:flutter/material.dart';

import 'db/TaskProvider.dart';
import 'widgets/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TaskProvider taskProvider = new TaskProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(taskProvider),
    );
  }
}
