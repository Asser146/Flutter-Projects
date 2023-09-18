import 'package:flutter/material.dart';
import 'dart:collection';

class SendersColorMap extends StatefulWidget {
  @override
  State<SendersColorMap> createState() => _SendersColorMapState();
  HashMap _sendersMap = new HashMap<dynamic, dynamic>();
  List<Color> messageColor = [
    Color(0xFFff515f),
    Color(0xFF43cea2),
    Color(0xFFb06ab3),
    Colors.blueGrey
  ];
  HashMap getSendersMap() {
    return _sendersMap;
  }

  void modify(String sender, Color color) {
    _sendersMap.addAll({sender: color});
  }

  Color getColor(String sender) {
    if (_sendersMap.length == 1) {
      return messageColor[0];
    } else {
      return _sendersMap[sender];
    }
  }
}

class _SendersColorMapState extends State<SendersColorMap> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
