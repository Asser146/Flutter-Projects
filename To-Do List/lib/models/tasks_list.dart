import 'package:flutter/cupertino.dart';
import 'task.dart';

class TasksList extends ChangeNotifier {
  List<Task> _tasks = [];
  int _counter = 0;

  void addToList(Task task) {
    _tasks.insert(0, task);
    _counter++;
    notifyListeners();
  }

  void clear() {
    _tasks.clear();
    _counter = 0;
    notifyListeners();
  }

  void finishTask(Task task) {
    _tasks.remove(task);
    _tasks.add(task);
    _counter--;
    notifyListeners();
  }

  List<Task> getTasks() {
    return _tasks;
  }

  int getActiveTasksCount() => _counter;
}
