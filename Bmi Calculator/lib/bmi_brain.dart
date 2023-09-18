import 'package:flutter/material.dart';
import 'dart:math';

class BmiBrain {
  late int height;
  late int weight;
  BmiBrain(int height, int weight) {
    this.height = height;
    this.weight = weight;
    _bmi=_calculate();
  }
  late double _bmi;
  late Color resultColor;

  double _calculate(){
    return  weight / pow(height / 100, 2);
  }
  String getResultNumber() {

    return _bmi.toStringAsFixed(1);
  }

  TextStyle resultStyle() {
    if (this._bmi >= 25) {
      resultColor = Colors.red.shade600;
    } else if (this._bmi > 18.5) {
      resultColor = Colors.green.shade700;
    } else {
      resultColor = Colors.deepOrangeAccent;
    }
    return TextStyle(
        color: resultColor, fontSize: 27, fontWeight: FontWeight.w600);
  }

  String getResultText() {
    if (this._bmi >= 25) {
      return "OverWight";
    } else if (this._bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWight";
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
