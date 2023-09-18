import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {

 IconData icon;
 String gender;
   GenderCard(this.icon,this.gender);
  @override
  Widget build(BuildContext context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          gender,
          style: myTextStyle,
        )
      ],
    ),
  );
  }
}
