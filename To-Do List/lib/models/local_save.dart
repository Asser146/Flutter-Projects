import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class LocalSave extends StatelessWidget {
  late final BuildContext context;
  late final SharedPreferences prefs;

  LocalSave(BuildContext calledContext){
    context=calledContext;
    loadData();
  }


  void loadData() async {
    prefs = await SharedPreferences.getInstance();
    int? size = prefs.getInt('length');
    if (size != null && size != 0) {
      List<Task> bufferDoneTasks = [], bufferNotDoneTask = [];
      Map<String, dynamic> jsonTask = <String, dynamic>{};
      Task decodedTask;
      for (int i = 0; i < size; i++) {
        jsonTask =
            jsonDecode(prefs.getString('task_$i')!) as Map<String, dynamic>;
        decodedTask = Task(title: jsonTask['title']);
        jsonTask['status'] == 'true'
            ? {decodedTask.setDone(), bufferDoneTasks.add(decodedTask)}
            : bufferNotDoneTask.add(decodedTask);
      }
      Provider.of<TasksList>(context, listen: false)
          .getTasks()
          .addAll(bufferNotDoneTask);
      Provider.of<TasksList>(context, listen: false)
          .getTasks()
          .addAll(bufferDoneTasks);
    }
  }

  void saveData(List<Task> tasksToSave) async {
    await prefs.setInt('length', tasksToSave.length);
    List<Map<String, dynamic>> jsonTask = <Map<String, dynamic>>[];
    for (int i = 0; i < tasksToSave.length; i++) {
      jsonTask.add({
        'title': tasksToSave[i].title,
        'status': '${tasksToSave[i].isDone}'
      });
      await prefs.setString('task_$i', jsonEncode(jsonTask[i]));
    }
    Provider.of<TasksList>(context, listen: false).resetListModification();
  }
void createNewList(){
      Provider.of<TasksList>(context,listen: false).clear();
      prefs.clear();
}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
