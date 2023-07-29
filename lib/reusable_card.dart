import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({
  //   super.key,
  // });
  ReusableCard(this.colour, [this.cardChild]);
  //agar idhar ise ese likhe---> ReusableCard({this.colour}) toh upar Reusable card ka object banate waqt ese naam pass krna padhega argument ka: ReusableCard(colour: <whatever>) abhi toh direct bhi kar skte hai-->ReusableCard(<whatever>)
  final Color colour;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(15.0),
      height: 200.0,
    );
  }
}
