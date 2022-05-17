import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/Utilities/snackBarUtil.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  bool isEmailVerified = false;

  // final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();

    // isEmailVerified = _authService.currentUser != null
    //     ? _authService.currentUser!.emailVerified
    //     : false;

    // if (!isEmailVerified) {
    //   _authService.sendVerificationEmail();
    // }
  }

  Future checkEmailVerified() async {
    // await _authService.currentUser!.reload();
    // setState(() {
    //   isEmailVerified = _authService.currentUser!.emailVerified;
    // });
    return isEmailVerified;
  }

  @override
  Widget build(BuildContext context) {
    if (isEmailVerified) {
      return const AuthScreen();
    } else {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 10.0),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5.0),
                      child: const AutoSizeText(
                        'Email Verification',
                        maxFontSize: 36.0,
                        minFontSize: 24.0,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: blacky,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/verifyimg.png',
                      width: 250.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 50.0),
                      child: const Center(
                        child: AutoSizeText(
                          'check your email and click the verification link to create your profile.',
                          textAlign: TextAlign.center,
                          minFontSize: 16.0,
                          textScaleFactor: 1.25,
                          style: TextStyle(
                            color: blacky,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    // TextButtonReusable(
                    //   textButtonText: 'Send Again :',
                    //   onPressed: () {},
                    // ),
                    ReusableElevatedButton(
                      buttonText: 'Check',
                      onPressed: () {
                        // if (await checkEmailVerified()) {
                        // } else {
                        //   SnackBarUtil.showSnackBar('Email is not verified');
                        // }
                        setState(() {
                          isEmailVerified = true;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ReusableElevatedButton(
                      buttonText: 'Cancel',
                      buttonColor: blacky,
                      textColor: whitey,
                      onPressed: () {
                        // _authService.signOut();
                        loggedUser = null;
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.authScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
