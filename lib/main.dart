import 'package:flutter/material.dart';

import 'db/TaskProvider.dart';
import 'widgets/pages/Home.dart';

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
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(taskProvider),
    );
  }
}
