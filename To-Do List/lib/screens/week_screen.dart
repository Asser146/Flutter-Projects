import 'package:flutter/material.dart';
import 'tasks_screen.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'package:todo_list/models/notifications_handler.dart';
import 'package:provider/provider.dart';

class WeekScreen extends StatelessWidget {
  final List<String> weekDays = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  late final NotificationsHandler myNotifications ;

  @override
  Widget build(BuildContext context) {
    myNotifications = NotificationsHandler(context);
    return WillPopScope(
      onWillPop: () {
        return myNotifications
            .checkToSave(Provider.of<TasksList>(context).getModificationStatus());
      },
      child: Scaffold(
        backgroundColor: Colors.green.shade200,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {

            myNotifications.showFinishedWeek();
          },
          // backgroundColor: Colors.blueAccent,
          child: const Icon(

            Icons.check,
            size: 38,
          ),
        ),

        appBar: AppBar(
          title: Text("Pick the Day"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < 7; i++) DayButton(day: weekDays[i]),
          ],
        ),
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  String day;
  DayButton({required this.day});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Container(
        child: TextButton(
          onPressed: () {
            Provider.of<TasksList>(context, listen: false).setWeekDay(day);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TasksScreen()),
            );
          },
          child: Text(
            day,
            style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[900],

                fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueGrey[500],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    ));
  }
}
