import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class backButton extends StatelessWidget {
  const backButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blacky,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
