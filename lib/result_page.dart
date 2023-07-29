import 'package:flutter/material.dart';
import 'reusable_card.dart';

class Results extends StatelessWidget {
  Results(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final bmiResult;
  final resultText;
  final interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              Colors.green.shade100,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toString().toUpperCase(),
                    style: TextStyle(
                        color: Colors.green.shade900,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 80.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                      color: Colors.green.shade100,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.black,
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
