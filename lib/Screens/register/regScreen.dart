import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/loading.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/Utilities/snackBarUtil.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';
import 'package:vacxpass_front/components/textButtonReusable.dart';
import 'package:vacxpass_front/components/textFieldReusable.dart';
import 'package:vacxpass_front/components/backButton.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  // final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String? email = '';
  String? password = '';

  bool loading = false;
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
              child: Stack(children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 40.0),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 5.0),
                          child: const AutoSizeText(
                            'Register',
                            maxFontSize: 36.0,
                            minFontSize: 24.0,
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: blacky,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Column(children: [
                          TextFieldReusable(
                            fieldLabelText: 'Email',
                            onChanged: (val) {
                              setState(() {
                                email = val;
                                // error = '';
                              });
                            },
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Email' : null,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFieldReusable(
                            fieldLabelText: 'Password',
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            validator: (val) => val!.length < 6
                                ? 'Enter Password of min.6 Chars. '
                                : null,
                            obscureText: true,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            alignment: Alignment.centerRight,
                            width: double.infinity,
                            child: const Text('Min 6 Characters.'),
                          ),
                          TextFieldReusable(
                            fieldLabelText: 'Confirm Password',
                            onChanged: (val) {},
                            validator: (val) => val != password
                                ? 'Passwords Do not match'
                                : null,
                            obscureText: true,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      val == null
                                          ? isChecked = false
                                          : isChecked = val;
                                    });
                                  },
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 40.0,
                                    ),
                                    const Text(
                                      'By Clicking Next, I agree to the',
                                      style: TextStyle(
                                        color: blacky,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextButtonReusable(
                                      textButtonText: 'Terms and Conditions',
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ]),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ]),
                        ReusableElevatedButton(
                          buttonText: 'Next',
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                isChecked) {
                              setState(() {
                                loading = true;
                              });
                              // dynamic result = await _authService
                              //     .regEmailPassword(email!, password!);

                              // if (result == null) {
                              //   setState(() {
                              //     loading = false;
                              //   });
                              // } else {
                              // }
                              Navigator.pushReplacementNamed(
                                  context, MyRoutes.verifyScreen);
                              setState(() {
                                loading = false;
                              });
                            } else {
                              SnackBarUtil.showSnackBar(
                                  'You must fill all the fields');
                            }
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
                const backButton(),
              ]),
            ),
          );
  }
}
