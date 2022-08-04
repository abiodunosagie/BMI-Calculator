import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screens/input_Page.dart';

void main() => runApp(BMICalculator());

const tabTitle = Colors.red;

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),

      debugShowCheckedModeBanner: false,
        home: InputPage(),
    );
  }
}
