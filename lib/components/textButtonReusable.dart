import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class TextButtonReusable extends StatelessWidget {
  final String textButtonText;
  final VoidCallback onPressed;

  const TextButtonReusable(
      {Key? key, required this.textButtonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButtonText,
        style: const TextStyle(
          color: blacky,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
