import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'screens/week_screen.dart';
import 'models/tasks_list.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksList(),
      child: MaterialApp(
        home: WeekScreen(),
      ),
    );
  }
}

