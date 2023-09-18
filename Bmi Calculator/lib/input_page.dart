import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'GenderCard.dart';
import 'constants.dart';
import 'results_page.dart';

enum genders { male, female }
enum actions {wight,age}

genders gender = genders.male;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Container(
        decoration: appDecoration(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = genders.male;
                          });
                        },
                        child: ReusableCard(
                          cardColor: gender == genders.male
                              ? selectedState
                              : normalState,
                          cardChild: GenderCard(FontAwesomeIcons.mars, "Male"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = genders.female;
                          });
                        },
                        child: ReusableCard(
                          cardColor: gender == genders.female
                              ? selectedState
                              : normalState,
                          cardChild:
                              GenderCard(FontAwesomeIcons.venus, "Female"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF0A0E29),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Height", style: myTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  inputHeight.toString(),
                                  style: numbersTextStyle,
                                ),
                                Text("cm", style: myTextStyle),
                              ],
                            ),
                            Slider(
                                value: inputHeight.toDouble(),
                                min: 110,
                                max: 210,
                                inactiveColor: Colors.deepOrangeAccent,
                                onChanged: (double newValue) {
                                  setState(() {
                                    inputHeight = newValue.round();
                                    print(inputHeight);
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: ButtonCard("weight", weightValue,actions.wight)),
                    Expanded(
                      child: ButtonCard("Age", ageValue,actions.age)
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultsPage(height: inputHeight, weight: weightValue),),
                  );
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
                      "Calculate",style:TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
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

  Container ButtonCard(String label,int value,actions type) {
    return Container(
      margin: EdgeInsets.all(3.5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF0A0E29),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: myTextStyle),
          Text(value.toString(), style: numbersTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  backgroundColor: Color(0xff4c4f5e),
                  child: const Icon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      value--;
                      type==actions.wight?(weightValue=value):ageValue=value;
                    });
                  }),
              FloatingActionButton(
                  backgroundColor: Color(0xff4c4f5e),
                  child: const Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      value++;
                      type==actions.wight?(weightValue=value):(ageValue=value);
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }
}
