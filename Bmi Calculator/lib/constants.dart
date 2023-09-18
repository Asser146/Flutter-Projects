import 'package:flutter/material.dart';

const Color selectedState = Color(0xFF0A0E49);
const Color normalState = Color(0xFF0A0E29);
Color maleCardColor = normalState;
Color femaleCardColor = normalState;

int inputHeight = 160;
int ageValue = 20;
int weightValue = 60;

TextStyle myTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w900,
  color: Color(0xff8d8e98),
);

TextStyle numbersTextStyle =
    TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900);



BoxDecoration appDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue,
        Colors.red,
      ],
    ),
  );
}
