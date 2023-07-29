// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_icon.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'bmi_brain.dart';

const paneColor = Color(0xffc8e6c9);
const pressedPaneColor = Color(0xffa5d6a7);
final kNumberTextStyle = TextStyle(
    color: Colors.green.shade900, fontWeight: FontWeight.w900, fontSize: 50.0);

enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = paneColor;
  Color femaleCardColor = paneColor;
  int height = 180;
  int weight = 60;
  int age = 24;

  void updateCardColor(GenderEnum gender) {
//  0--male, 1--female
    setState(() {
      // if (gender == 0) {
      //   if (maleCardColor == paneColor) {
      //     maleCardColor = pressedPaneColor;
      //     femaleCardColor = paneColor;
      //   } else {
      //     maleCardColor = paneColor;
      //   }
      // } else {
      //   if (femaleCardColor == paneColor) {
      //     femaleCardColor = pressedPaneColor;
      //     maleCardColor = paneColor;
      //   } else {
      //     femaleCardColor = paneColor;
      //   }
      // }
      femaleCardColor = (gender == GenderEnum.male)
          ? paneColor
          : (femaleCardColor == paneColor)
              ? pressedPaneColor
              : paneColor;
      maleCardColor = (gender == GenderEnum.female)
          ? paneColor
          : (maleCardColor == paneColor)
              ? pressedPaneColor
              : paneColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateCardColor(GenderEnum.male);
                    },
                    child: ReusableCard(
                      maleCardColor,
                      GenderIcon('MALE', FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateCardColor(GenderEnum.female);
                    },
                    child: ReusableCard(
                      femaleCardColor,
                      GenderIcon('FEMALE', FontAwesomeIcons.venus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              paneColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(color: Colors.green[500], fontSize: 20.0),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style:
                            TextStyle(color: Colors.green[500], fontSize: 20.0),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    paneColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              color: Colors.green[500], fontSize: 20.0),
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    paneColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              color: Colors.green[500], fontSize: 20.0),
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                age--;
                              });
                            }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiBrain b = BmiBrain(height: (height), weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Results(
                      bmiResult: b.calculateBmi(),
                      resultText: b.getResult(),
                      interpretation: b.getInterpretation(),
                    );
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: paneColor,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.black,
              height: 80.0,
            ),
          ),
        ],
      ), //0xFF1D1E33
    );
  }
}

class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({super.key});
  RoundIconButton(this.icon, this.fun);
  IconData icon;
  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 26.0,
      ),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: fun,
      shape: CircleBorder(),
      fillColor: Colors.green.shade900.withAlpha(70),
    );
  }
}
