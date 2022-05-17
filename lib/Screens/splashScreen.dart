import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MyRoutes.authScreen);
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: const AutoSizeText(
                    'Welcome',
                    textScaleFactor: 2.2,
                    style: TextStyle(
                      color: blacky,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/flashscreenlogo.png',
                  width: 115.0,
                ),
                Column(children: const [
                  AutoSizeText(
                    'VacXpass',
                    textScaleFactor: 1.75,
                    style: TextStyle(
                      color: blacky,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AutoSizeText(
                    'By VODKA-Labs',
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: theGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  )
                ]),
              ]),
        ),
      ),
    );
  }
}
