import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/todo_provider.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProvider, _) {
      List<Task> tasks = todoProvider.tasks;

      return ListView.builder(
         itemCount: tasks.length,
         itemBuilder: (context, index){
           Task task = tasks[index];
           return Dismissible(
             key: Key(task.name),
             onDismissed: (direction) {
               String taskName = task.name;
               todoProvider.removeTask(index);
               Scaffold
                   .of(context)
                   .showSnackBar(SnackBar(content: Text("${taskName} deleted")));
             },
             background: Container(color: Colors.lightBlueAccent),
             child: TaskTile(taskTitle: tasks[index].name,
                 isChecked: tasks[index].isDone,
                 checkboxCallback: (bool checkboxState) {
                     todoProvider.toggleCheckBox(index);
                 }),
           );
         },
       );
    });

  }
}



