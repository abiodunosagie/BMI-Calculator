import 'package:bmi_calculator/Component/buttom_botton.dart';
import 'package:bmi_calculator/Component/reuseabel_card.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Component/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 60;
  int age = 27;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: kAppBarCustomColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                    child: ReuseableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ))),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text('inches', style: kLabelTextStyle),
                    ],
                  ),
                  // SliderTheme(
                  //   data: SliderTheme.of(context).copyWith(
                  //       activeTrackColor: Colors.white,
                  //       inactiveTrackColor: const Color(0xFF8D8E98),
                  //       overlayColor: const Color(0x29eb1555),
                  //       thumbColor: const Color(0xffeb1555),
                  //       thumbShape: const RoundSliderThumbShape(
                  //           enabledThumbRadius: 15.0),
                  //       overlayShape:
                  //           const RoundSliderOverlayShape(overlayRadius: 30.0)),
                  //   child: Slider(
                  //     value: height.toDouble(),
                  //     min: 120.0,
                  //     max: 220.0,
                  //     onChanged: (double newValue) {
                  //       setState(
                  //         () {
                  //           height = newValue.round();
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   colour: Colors.white,
                            //   onPressed: () {
                            //     setState(
                            //       () {
                            //         weight--;
                            //       },
                            //     );
                            //   },
                            // ),
                            // const SizedBox(width: 10.0),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   colour: Colors.white,
                            //   onPressed: () {
                            //     setState(
                            //       () {
                            //         weight++;
                            //       },
                            //     );
                            //   },
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   colour: Colors.white,
                            //   onPressed: () {
                            //     setState(
                            //       () {
                            //         age--;
                            //       },
                            //     );
                            //   },
                            // ),
                            // const SizedBox(width: 10.0),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   colour: Colors.white,
                            //   onPressed: () {
                            //     setState(
                            //       () {
                            //         age++;
                            //       },
                            //     );
                            //   },
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
