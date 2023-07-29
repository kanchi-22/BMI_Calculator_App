import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Color(0XFF59805A), secondary: Colors.purple),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.red),
        ),
        scaffoldBackgroundColor: Color(0XFF6C8D6E), //0XFF6C8D6E
      ),
      home: InputPage(),
    );
  }
}
