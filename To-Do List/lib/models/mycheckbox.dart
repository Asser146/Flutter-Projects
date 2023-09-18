import 'package:flutter/material.dart';
import 'task.dart';
class myCheckBox extends StatelessWidget {
  late final Task task;
  late final Function triggerToggle;
  myCheckBox({required this.triggerToggle, required this.task});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: task.getMark(),
        onChanged: (value) {
          triggerToggle(task);
         });
  }
}