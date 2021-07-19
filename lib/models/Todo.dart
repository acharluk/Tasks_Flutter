import 'package:todo_acl/utils/TodoState.dart';

class Todo {
  String title;
  String description;
  int state;

  Todo({required this.title, required this.description})
      : this.state = TodoState.TODO;
}
