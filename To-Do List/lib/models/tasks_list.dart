import 'package:flutter/cupertino.dart';
import 'task.dart';

class TasksList extends ChangeNotifier {
  List<Task> _tasks = [];
  int _counter = 0;
  bool listModified = false;


  void addToList(Task task) {
    _tasks.insert(0, task);
    _counter++;
    setListModification();
    notifyListeners();
  }

  void clear() {
    _tasks.clear();
    _counter = 0;
    setListModification();
    notifyListeners();
  }

  void finishTask(Task task) {
    _tasks.remove(task);
    _tasks.add(task);
    _counter--;
    setListModification();
    notifyListeners();
  }

  List<Task> getTasks() =>_tasks;

  int getActiveTasksCount() => _counter;

  bool getModificationStatus()=>listModified;

  void setListModification()=>listModified=true;
  void resetListModification()=>listModified=false;
}
