import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class SnackBarUtil {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
      backgroundColor: pinkDanger,
      padding: const EdgeInsets.all(30.0),
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
