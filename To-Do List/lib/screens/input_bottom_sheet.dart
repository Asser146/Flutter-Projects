import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'package:provider/provider.dart';

class InputSheet extends StatelessWidget {
  String taskTitle = "Default";
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: textFieldController,
              onChanged: (text) {
                taskTitle = text;
              },
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<TasksList>(context,listen: false).addToList(Task(title: taskTitle));
              textFieldController.clear();
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              color: Colors.blueAccent,
              child: const Center(
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
