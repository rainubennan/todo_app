import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/home.dart';

void main() async {
 await Hive.initFlutter();
 var box = await Hive.openBox('mybox');
  runApp(const Todo_Main());
}

class Todo_Main extends StatelessWidget {
  const Todo_Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Home(),
       theme: ThemeData(primarySwatch: Colors.yellow),
       debugShowCheckedModeBanner: false,
    );
  }
}
