import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';

class CompProfileScreen extends StatelessWidget {
  CompProfileScreen({Key? key}) : super(key: key);
  // final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 100),
                    child: const AutoSizeText(
                      'To complete your profile.\nPlease fill in your details',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ReusableElevatedButton(
                    buttonText: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.userDetailsScreen);
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ReusableElevatedButton(
                    buttonText: 'Sign Out',
                    onPressed: () async {
                      // await _authService.signOut();
                      loggedUser = null;
                      Navigator.pushNamedAndRemoveUntil(
                          context, MyRoutes.authScreen, (route) => false);
                    },
                    buttonColor: pinkDanger,
                    textColor: whitey,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
