import 'package:tasks_app_acl/utils/TaskState.dart';

class Task {
  String title;
  String description;
  int state;

  Task({required this.title, required this.description})
      : this.state = TaskState.TODO;
}
