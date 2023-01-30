import 'package:flutter/material.dart';
import 'package:frontend/view/todolist_screen.dart';

//The main function is the entry point of the app.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //MaterialApp is the top-level widget that provides the Material design visual layout structure
    return const MaterialApp(
      // Boolean set to false to hide the debug appbar in the app
      debugShowCheckedModeBanner: false,
      title: 'To Do List Flutter',
      //Home property defines the default screen of the app
      home: ToDoListScreen(),
    );
  }
}
