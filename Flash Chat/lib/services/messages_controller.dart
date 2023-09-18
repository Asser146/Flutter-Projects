import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:my_flash_chat/services/sender_colors_map.dart';

late User loggedinUser;
SendersColorMap map = SendersColorMap();
class MessageStream extends StatelessWidget {
  final _fireStore = FirebaseFirestore.instance;
  void modifyDataBase(String msg){
    _fireStore.collection("messages").add({
      'text': msg,
      'sender': loggedinUser.email,
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore.collection("messages").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          );
        }
        List<Message> messages = [];

        final data = snapshot.data?.docs.reversed;
        for (var content in data!) {
          final text = content.data()['text'];
          final sender = content.data()['sender'];
          if (sender != loggedinUser.email &&
              !map.getSendersMap().containsKey(sender)) {
            Color initColor =
            map.messageColor[Random().nextInt(map.messageColor.length)];
            map.modify(sender, initColor);
            map.messageColor.remove(initColor);
          }
          messages.add(Message(text, sender));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messages,
          ),
        );
      },
    );
  }
}

class Message extends StatelessWidget {
  final String text, sender;
  late bool isMe;
  Message(this.text, this.sender);

  BorderRadius getBorders() {
    if (loggedinUser.email == sender) {
      return const BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35));
    } else {
      return const BorderRadius.only(
          topRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: loggedinUser.email == sender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(sender, style: const TextStyle(fontSize: 15)),
            Material(
              elevation: 7,
              borderRadius: getBorders(),
              color:
              loggedinUser.email == sender ? myColor : map.getColor(sender),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
