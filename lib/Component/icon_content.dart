import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w400,
  color: Color(0xff8d8e98),
);

class IconContent extends StatelessWidget {
  IconContent({this.icon, required this.label});

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}