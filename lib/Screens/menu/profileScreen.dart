import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
import 'package:vacxpass_front/Screens/register/compProfileScreen.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/components/backButton.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  // final AuthService _authService = AuthService();
  String? name = loggedUser?.name;
  String? nic = loggedUser?.nic;
  String? dob = loggedUser?.dob;
  @override
  Widget build(BuildContext context) {
    if (name == null) {
      return CompProfileScreen();
    } else {
      return Scaffold(
        body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 100),
                alignment: Alignment.center,
                child: Column(children: [
                  Container(
                    width: 250.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 50.0,
                    ),
                    child: Column(children: [
                      const FieldNameText(fieldText: 'Name'),
                      FieldValue(val: name),
                      const FieldNameText(fieldText: 'NIC/Passport No:'),
                      FieldValue(val: nic),
                      const FieldNameText(fieldText: 'DoB'),
                      FieldValue(val: dob),
                      const FieldNameText(fieldText: 'Vaccination Status'),
                      const FieldValue(val: 'Processing'),
                    ]),
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
            const backButton()
          ]),
        ),
      );
    }
  }
}

class FieldValue extends StatelessWidget {
  const FieldValue({Key? key, required this.val}) : super(key: key);

  final String? val;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          AutoSizeText(
            val != null ? val as String : 'null',
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: blacky),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
            height: 5,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class FieldNameText extends StatelessWidget {
  final String fieldText;

  const FieldNameText({Key? key, required this.fieldText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      fieldText,
      minFontSize: 18.0,
      style: const TextStyle(fontWeight: FontWeight.w500, color: theGrey),
    );
  }
}
