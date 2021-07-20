import 'package:tasks_app_acl/utils/TaskState.dart';

final String columnId = 'id';

class Task {
  int id;
  String title;
  String description;
  int state;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.state = TaskState.TO_DO,
  });
}
