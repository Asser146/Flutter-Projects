import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class LocalSave extends StatelessWidget {
  late final BuildContext context;
  late  SharedPreferences prefs;

  LocalSave(BuildContext calledContext){
    context=calledContext;
    // loadData();
  }


  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    String day=Provider.of<TasksList>(context,listen: false).getWeekDay();
    Provider.of<TasksList>(context, listen: false)
        .getTasks().clear();
    int? size = prefs.getInt('$day length');
    if (size != null && size != 0) {
      List<Task> bufferDoneTasks = [], bufferNotDoneTask = [];
      Map<String, dynamic> jsonTask = <String, dynamic>{};
      Task decodedTask;
      for (int i = 0; i < size; i++) {
        jsonTask =
            jsonDecode(prefs.getString('$day task_$i')!) as Map<String, dynamic>;
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
      Provider.of<TasksList>(context, listen: false)
          .update(bufferNotDoneTask.length);
    }
  }

  void saveData(List<Task> tasksToSave) async {
    prefs = await SharedPreferences.getInstance();
    String day=Provider.of<TasksList>(context,listen: false).getWeekDay();
    await prefs.setInt('$day length', tasksToSave.length);
    List<Map<String, dynamic>> jsonTask = <Map<String, dynamic>>[];
    for (int i = 0; i < tasksToSave.length; i++) {
      jsonTask.add({
        'title': tasksToSave[i].title,
        'status': '${tasksToSave[i].isDone}'
      });
      await prefs.setString('$day task_$i', jsonEncode(jsonTask[i]));
    }
    Provider.of<TasksList>(context, listen: false).resetListModification();
  }
void createNewDayList(){
      Provider.of<TasksList>(context,listen: false).clear();
      List<Task>empty=[];
      saveData(empty);
}
  void createNewWeekList()async{
    Provider.of<TasksList>(context,listen: false).clear();
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
