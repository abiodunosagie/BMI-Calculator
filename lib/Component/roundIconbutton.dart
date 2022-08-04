import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.icon, required this.colour, required this.onPressed});
  final IconData icon;
  final Color colour;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 55.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
