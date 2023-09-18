import 'package:flutter/material.dart';
import 'package:todo_list/models/tasks_displayer.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'package:todo_list/screens/input_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: InputSheet(),
                  )));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          size: 48,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Top Container
        Container(
          padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const CircleAvatar(
                 radius: 40,
                 backgroundColor: Colors.white,
                 child: Icon(
                   Icons.list_rounded,
                   size: 70,
                   color: Colors.lightBlue,
                 ),
               ),
              const SizedBox(height: 10),
              const Text("To-Do",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              Text("Active Tasks: ${Provider.of<TasksList>(context).getActiveTasksCount()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Provider.of<TasksList>(context).getTasks().isEmpty?
                    Center(child: Text("Add New Tasks !!",
                    style: TextStyle(
                      color: Colors.blueGrey[500],
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                    ),))
                    :TasksDisplayer())),
     
      ]),
    );
  }

}
