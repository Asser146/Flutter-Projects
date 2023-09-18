import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'reusable_card.dart';
import 'bmi_brain.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.height, required this.weight});
  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    BmiBrain bmi = BmiBrain(height, weight);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Result'),
      ),
      body: SafeArea(
        child: Container(
          decoration: appDecoration(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ReusableCard(
                  cardColor: normalState,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmi.getResultText(),
                        style: bmi.resultStyle(),
                      ),
                      Text(
                        bmi.getResultNumber(),
                        style: numbersTextStyle.copyWith(fontSize: 70),
                      ),
                      Text(bmi.getDescription(),
                          style: myTextStyle.copyWith(fontSize: 25),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple[800],
                  ),
                  child: Center(
                    child: Text(
                      "Re-Calculate",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
