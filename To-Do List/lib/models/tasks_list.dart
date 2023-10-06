import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'task.dart';

class TasksList extends ChangeNotifier {
  List<Task> _tasks = [];
  Map<String, int> _activeDayTasks = HashMap();
  final init = {'Saturday':0, 'Sunday':0, 'Monday':0, 'Tuesday':0, 'Wednesday':0, 'Thursday':0, 'Friday':0};

  bool listModified = false;
  late String weekDay;
void setWeekDay(String day){
  weekDay=day;
  notifyListeners();
}
void update(int size){
  _activeDayTasks.addAll({weekDay:size});
  notifyListeners();
}
  void addToList(Task task) {
    _tasks.insert(0, task);
    _activeDayTasks[weekDay] ==null?{_activeDayTasks[weekDay]=0}:null;
    _activeDayTasks[weekDay]=(_activeDayTasks[weekDay]!+1);
    setListModification();
    notifyListeners();
  }

  void clear() {
    _tasks.clear();
    _activeDayTasks[weekDay]=0;
    setListModification();
    notifyListeners();
  }

  void finishTask(Task task) {
    _tasks.remove(task);
    _tasks.add(task);
    _activeDayTasks[weekDay]=(_activeDayTasks[weekDay]!-1);
    setListModification();
    notifyListeners();
  }

  List<Task> getTasks() =>_tasks;

  int? getActiveTasksCount() => _activeDayTasks[weekDay] ?? 0;

  bool getModificationStatus()=>listModified;

  void setListModification()=>listModified=true;
  void resetListModification()=>listModified=false;
  String getWeekDay()=>this.weekDay;
}
