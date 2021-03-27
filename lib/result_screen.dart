import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final double bmiRes;
  final String bmiStr;
  final String bmiOverview;
  ResultPage({this.bmiRes, this.bmiStr, this.bmiOverview});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YOUR ARE $bmiStr"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Center(
              child: Text(
                "Your BMI IS ${bmiRes.toStringAsFixed(2)}",
                style: kLabelTextStyle,
              ),
            ),
          ),
        ),
        Expanded(
            child: ReusableCard(
          colour: kActiveCardColour,
          cardChild: Center(
            child: Text(
              "$bmiOverview",
              style: kLabelTextStyle,
            ),
          ),
        )),
        BottomButton(
            title: "RECALCULATE BMI",
            func: () {
              Navigator.pop(context);
            }),
      ]),
    );
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             flex: 5,
//             child: Column(
//               children: [
//                 ReusableCard(
//                   colour: kActiveCardColour,
//                   cardChild: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Your BMI IS ${bmiRes.toStringAsFixed(2)}",
//                         style: kLabelTextStyle,
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Text(
//                         "$bmiOverview",
//                         style: kLabelTextStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: BottomButton(
//                 title: "RECALCULATE BMI",
//                 func: () {
//                   Navigator.pop(context);
//                 }),
//           )
//         ],
//       ),
