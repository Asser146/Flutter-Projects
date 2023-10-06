import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/local_save.dart';
import 'package:todo_list/models/tasks_list.dart';
import 'package:provider/provider.dart';

class NotificationsHandler extends StatelessWidget {
  late final BuildContext context;
  late final LocalSave loadSaveHandler;

  NotificationsHandler(BuildContext calledContext) {
    context = calledContext;
    loadSaveHandler = LocalSave(context);
  }
  TextStyle notiTitleStyle(){
    return  TextStyle(
    fontSize: 25,
  );
  }
  TextStyle optionsTitleStyle(){
    return const TextStyle(
      fontSize: 20,
    );
  }
  Future<void> showSavedNotification() async {
    loadSaveHandler
        .saveData(Provider.of<TasksList>(context, listen: false).getTasks());
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title:  Text('List Saved!',style: notiTitleStyle(),),
          actions: <Widget>[
            TextButton(
              child:  Text('OK',style: optionsTitleStyle(),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> showFinishedWeek() async {
    // loadSaveHandler
    //     .saveData(Provider.of<TasksList>(context, listen: false).getTasks());
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title:  Text('Congratulations 🎉!',style: notiTitleStyle(),),
          content: Text("You finished another week!",style: optionsTitleStyle(),),
          actions: <Widget>[
            TextButton(
              child:  Text('Done',style: optionsTitleStyle(),),
              onPressed: () {
                loadSaveHandler.createNewWeekList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<bool> checkToSave(bool status) async {
    if (status) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Center(
                child:  Text(
              'Warning',style: notiTitleStyle().copyWith(color: Colors.red),
            )),
            content: Text("Changes are not saved!",style: optionsTitleStyle(),),
            actions: <Widget>[
              TextButton(
                child:  Text('Save',style: optionsTitleStyle(),),
                onPressed: () {
                  loadSaveHandler.saveData(
                      Provider.of<TasksList>(context, listen: false)
                          .getTasks());
                  Navigator.of(context).pop();

                },

              ),
              TextButton(
                child:  Text('Cancel',style: optionsTitleStyle(),),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }
    return true;
  }

  Future<void> showListOptions() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Create New List?'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                loadSaveHandler.createNewDayList();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
