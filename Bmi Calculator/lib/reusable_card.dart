import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
   late Color cardColor;
    late Widget cardChild;
    late Function action;

   ReusableCard({required this.cardColor,required this.cardChild});


   @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: cardColor,
      ),
    );
  }



}