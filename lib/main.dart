import 'package:flutter/material.dart';
import 'package:todoey/screens/TaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'model/todo_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => TodoProvider())
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}



