import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class MenuButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  MenuButton(
      {required this.buttonText,
      required this.onPressed,
      this.textColor = whitey,
      this.buttonColor = blacky}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(210.0, 0.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 15.0,
            ),
            primary: buttonColor,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: AutoSizeText(
            buttonText,
            minFontSize: 16,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
