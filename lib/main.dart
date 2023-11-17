import 'package:bmi_calculator/Screens/input_Page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

const tabTitle = Colors.red;

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff0a0e21),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
