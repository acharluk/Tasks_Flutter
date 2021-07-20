import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db/TaskProvider.dart';
import 'widgets/pages/Home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
      home: Home(),
    );
  }
}
