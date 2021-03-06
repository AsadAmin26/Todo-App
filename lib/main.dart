import 'package:flutter/material.dart';
import 'todoapp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Todo App')),
        ),
        body: TodoApp(),
      ),
    );
  }
}
