import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final title;
  final Function func;
  BottomButton({this.title, this.func});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 8,
      ),
      onTap: func,
    );
  }
}
