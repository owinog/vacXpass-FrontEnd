import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
// import 'package:vacxpass_front/Services/database.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/components/menuButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final DatabaseService _databaseService =
  //     DatabaseService(uid: loggedUser!.uid);
  @override
  Widget build(BuildContext context) {
    print('');
    print('> Home Screen');
    print('');
    // _databaseService.getUserData();

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              const AutoSizeText(
                'vacXpass',
                minFontSize: 30.0,
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: blacky,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 45.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 125.0,
                ),
              ),
              Column(
                children: [
                  MenuButton(
                      buttonText: 'Profile',
                      onPressed: () {
                        loggedUser?.name = 'Elong Husk';
                        loggedUser?.dob = '1969-4-20';
                        loggedUser?.nic = '6942069420';
                        Navigator.pushNamed(context, MyRoutes.profileScreen);
                      },
                      textColor: blacky,
                      buttonColor: kindaYellow),
                  MenuButton(
                    buttonText: 'How To Use',
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.howToScreen);
                    },
                  ),
                  MenuButton(
                    buttonText: 'About Us',
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.aboutScreen);
                    },
                  ),
                  MenuButton(
                    buttonText: 'Report Problems',
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.reportScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
