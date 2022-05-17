import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class ReusableElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  ReusableElevatedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = kindaYellow,
    this.textColor = blacky,
  }) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 10.0,
        ),
        primary: buttonColor,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: AutoSizeText(
        buttonText,
        minFontSize: 16.0,
        textScaleFactor: 1.25,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
