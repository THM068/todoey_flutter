import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/todo_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    TextEditingController textEditingController = TextEditingController();
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              controller: textEditingController,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                String name = textEditingController.text;
                if(name != null && name.isNotEmpty) {
                  todoProvider.addTask(new Task(name: textEditingController.text));
                  textEditingController.text = "";
                }
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
