import 'package:flutter/material.dart';

class GenderIcon extends StatelessWidget {
  GenderIcon(this.gender, this.gicon);
  // final Font
  final String gender;
  final IconData gicon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gicon,
          size: 80.0,
          color: Colors.green[900],
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(color: Colors.green[500], fontSize: 20.0),
        ),
      ],
    );
  }
}
