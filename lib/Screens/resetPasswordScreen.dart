import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/loading.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/snackBarUtil.dart';
import 'package:vacxpass_front/components/backButton.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';
import 'package:vacxpass_front/components/textFieldReusable.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  // final AuthService _authService = AuthService();

  String? email = '';

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 20),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 5.0),
                            child: const AutoSizeText(
                              'Reset Password',
                              maxFontSize: 36.0,
                              minFontSize: 24.0,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: blacky,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 40.0),
                            child: const Center(
                              child: AutoSizeText(
                                'Enter your account email to send password reset instructions.',
                                textAlign: TextAlign.center,
                                minFontSize: 16.0,
                                textScaleFactor: 1.25,
                                style: TextStyle(
                                  color: blacky,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          TextFieldReusable(
                            fieldLabelText: 'Email',
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Email' : null,
                          ),
                          const SizedBox(
                            height: 80.0,
                          ),
                          ReusableElevatedButton(
                            buttonText: 'Send Code',
                            onPressed: () async {
                              if (_formKey.currentState != null
                                  ? _formKey.currentState!.validate()
                                  : false) {
                                // setState(() {
                                //   loading = true;
                                // });
                                // bool result = await _authService
                                //     .sendPasswordResetEmail(email);
                                // if (result) {
                                //   setState(() {
                                //     loading = false;
                                //   });
                                // }
                                SnackBarUtil.showSnackBar(
                                    'Password reset instructions sent to provided email');
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ]),
                      ),
                    ),
                  ),
                  const backButton()
                ],
              ),
            ),
          );
  }
}
