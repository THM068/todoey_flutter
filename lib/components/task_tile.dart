import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is a task"),
      trailing: new TaskCheckbox(),
    );
  }
}

class TaskCheckbox extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TaskCheckbox();
}

class _TaskCheckbox extends State<TaskCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (newValue) {
          setState(() {
            isChecked = newValue;
          });

        });
  }
}

