import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final focus = FocusNode();

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Add task"),
    );
  }

  Padding _buildBody() {
    InputDecoration _getInputDecoration() {
      return InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Title",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            controller: titleTextController,
            autofocus: true,
            decoration: _getInputDecoration(),
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(focus);
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            controller: descriptionTextController,
            minLines: 3,
            maxLines: 8,
            focusNode: focus,
            decoration: _getInputDecoration(),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // TODO: Save task to db
        Navigator.pop(context);
      },
      child: Icon(FontAwesome5.check),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }
}
