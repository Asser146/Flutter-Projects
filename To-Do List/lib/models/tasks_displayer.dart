import 'package:flutter/material.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'task.dart';
import 'task_builder.dart';
import 'package:provider/provider.dart';

class TasksDisplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksList>(
      builder: (context, tasksStatues, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskBuilder(
              task: tasksStatues.getTasks()[index],
              trigger: (Task task) {
                var task = tasksStatues.getTasks()[index];
                if (!task.getMark()) {
                  task.toggle();
                  tasksStatues.finishTask(task);
                }
              },
            );
          },
          itemCount: tasksStatues.getTasks().length,
        );
      },
    );
  }
}
