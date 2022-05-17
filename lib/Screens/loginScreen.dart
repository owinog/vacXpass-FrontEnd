import 'package:flutter/material.dart';
import 'package:vacxpass_front/Models/appUser.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/loading.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';
import 'package:vacxpass_front/components/textButtonReusable.dart';
import 'package:vacxpass_front/components/textFieldReusable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // final AuthService _authService = AuthService();

  //text field state
  String? email = '';
  String? password = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 30.0,
                          horizontal: 25.0,
                        ),
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: TextButtonReusable(
                          textButtonText: 'How to Use?',
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.howToScreen);
                          },
                        ),
                      ),
                      Image.asset(
                        'assets/images/loginpageimg.png',
                        width: 230,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 35.0,
                          vertical: 20.0,
                        ),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                            child: const Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w600,
                                color: blacky,
                              ),
                            ),
                          ),
                          TextFieldReusable(
                            fieldLabelText: 'Email',
                            onChanged: (val) async {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Email' : null,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFieldReusable(
                            onChanged: (val) async {
                              setState(() => password = val);
                            },
                            fieldLabelText: 'Password',
                            validator: (val) => val!.length < 6
                                ? 'Enter Password of min.6 Chars. '
                                : null,
                            obscureText: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButtonReusable(
                                textButtonText: 'Forget Password?',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.resetPassword1);
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          ReusableElevatedButton(
                            buttonText: 'Login',
                            onPressed: () async {
                              if (_formKey.currentState != null
                                  ? _formKey.currentState!.validate()
                                  : false) {
                                setState(() => loading = true);
                                // AppUser? result = await _authService
                                //     .signInEmailPassword(email!, password!);
                                // if (result != null) {
                                //   loggedUser = result;
                                // }
                                loggedUser = AppUser(uid: '123');
                                Navigator.pushReplacementNamed(
                                    context, MyRoutes.verifyScreen);
                                setState(() {
                                  loading = false;
                                });
                              }
                            },
                          )
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'New User?',
                            style: TextStyle(
                              color: blacky,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButtonReusable(
                            textButtonText: 'Sign Up',
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.regScreen);
                            },
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
  }
}


//--------Login Page end------
