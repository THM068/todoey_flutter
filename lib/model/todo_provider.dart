import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task.dart';

class TodoProvider with ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Feed the cat'),
    Task(name: 'Buy coat')
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    this._tasks.add(task);
    notifyListeners();
  }

  void toggleCheckBox(int index) {
    this._tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTask(int index) {
    this._tasks.removeAt(index);
    notifyListeners();
  }


}

