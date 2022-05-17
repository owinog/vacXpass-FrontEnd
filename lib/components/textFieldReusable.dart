import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class TextFieldReusable extends StatelessWidget {
  final String fieldLabelText;

  final bool obscureText;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;

  TextFieldReusable(
      {Key? key,
      required this.fieldLabelText,
      required this.onChanged,
      this.validator,
      this.obscureText = false})
      : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        labelText: fieldLabelText,
        labelStyle: const TextStyle(
          color: greyText,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: theGrey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: theGrey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: theGrey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: theGrey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
