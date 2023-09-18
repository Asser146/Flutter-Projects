import 'package:flutter/material.dart';
import 'package:my_flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flash_chat/services/messages_controller.dart';


class ChatScreen extends StatefulWidget {
  static String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late String messegeText;
  final messageBoxController = TextEditingController();

  getCurrentUser() async {
    final user = await _auth.currentUser;
    try {
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                final Color color=map.getSendersMap()[loggedinUser.email];
                  map.messageColor.add(color);
                Navigator.pop(context);
              }),
        ],
        title: const Text('Chat...'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            gradient1,
            gradient2,
          ],
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageBoxController,
                        onChanged: (value) {
                          messegeText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        MessageStream().modifyDataBase(messegeText);
                        messageBoxController.clear();
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

