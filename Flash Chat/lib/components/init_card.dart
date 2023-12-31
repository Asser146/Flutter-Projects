import 'package:flutter/material.dart';


class InitCard extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color cardColor;
  InitCard({
    required this.text,
    required this.onPressed,
    required this.cardColor,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: cardColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
