import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/card_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/result_screen.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //The cards for male and female selection
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: (selectedGender == Gender.male)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardContent(
                      gender: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: (selectedGender == Gender.female)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardContent(
                      gender: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //The slider
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$height",
                        style: kHeightSliderDisp,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xEFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      trackHeight: 0.9,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: Color(0xFFEB1555),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //bla bla cards
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "$weight",
                              style: kHeightSliderDisp,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              childIcon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              fun: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childIcon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              fun: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "$age",
                              style: kHeightSliderDisp,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              childIcon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              fun: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childIcon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              fun: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //The calculate BMI Banner
          BottomButton(
            title: "CALCULATE BMI",
            func: () {
              BmiCalculate calc = BmiCalculate(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiRes: calc.calculateBmi(),
                    bmiStr: calc.getResult(),
                    bmiOverview: calc.captionResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Widget childIcon;
  final Function fun;
  RoundIconButton({this.childIcon, this.fun});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      onPressed: fun,
      child: childIcon,
    );
  }
}
