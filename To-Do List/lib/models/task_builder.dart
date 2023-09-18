import 'package:flutter/material.dart';
import 'task.dart';
import 'mycheckbox.dart';

class TaskBuilder extends StatelessWidget {
  late  Task task;
  late  Function trigger;

  TaskBuilder({required this.task,required this.trigger});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          task.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              decoration:
              task.getMark() ? TextDecoration.lineThrough : null),
        ),
        trailing: myCheckBox(
          triggerToggle:trigger,
          task:task,
        )
    );
  }
}