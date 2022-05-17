import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacxpass_front/Models/appUser.dart';
import 'package:vacxpass_front/Screens/loginScreen.dart';
import 'package:vacxpass_front/Screens/navigateScreen.dart';

AppUser? loggedUser;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    print('');
    print('> auth Screen');
    print('');
    // DatabaseService databaseService;
    // loggedUser = Provider.of<AppUser?>(context);

    if (loggedUser == null) {
      return const LoginScreen();
    } else {
      return const NavigateScreen();
    }
  }
}
