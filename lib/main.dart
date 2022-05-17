import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:vacxpass_front/Models/appUser.dart';
import 'package:vacxpass_front/Screens/menu/howToScreen.dart';
import 'package:vacxpass_front/Screens/navigateScreen.dart';
import 'package:vacxpass_front/Screens/menu/profileScreen.dart';
import 'package:vacxpass_front/Screens/register/emailVerifyScreen.dart';
import 'package:vacxpass_front/Screens/register/compProfileScreen.dart';
import 'package:vacxpass_front/Screens/register/userDetailsScreen.dart';
import 'package:vacxpass_front/Screens/menu/report_problem.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
// import 'package:vacxpass_front/Services/auth.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/Screens/navigate/homeScreen.dart';
import 'package:vacxpass_front/Screens/loginScreen.dart';
import 'package:vacxpass_front/Screens/resetPasswordScreen.dart';
import 'package:vacxpass_front/Screens/register/regScreen.dart';
import 'package:vacxpass_front/Screens/splashScreen.dart';
import 'package:vacxpass_front/Screens/menu/about_us.dart';
import 'package:provider/provider.dart';
import 'package:vacxpass_front/Utilities/snackBarUtil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const VacxpassApp());
}

class VacxpassApp extends StatelessWidget {
  const VacxpassApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<AppUser?>.value(
    //   value: AuthService().user,
    //   initialData: null,
    //   child:
    return MaterialApp(
      scaffoldMessengerKey: SnackBarUtil.messengerKey,
      theme: ThemeData(fontFamily: 'poppins'),
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homeScreen: (context) => const HomeScreen(),
        MyRoutes.loginScreen: (context) => const LoginScreen(),
        MyRoutes.resetPassword1: (context) => const ResetPasswordScreen(),
        MyRoutes.regScreen: (context) => const RegScreen(),
        MyRoutes.verifyScreen: (context) => const EmailVerifyScreen(),
        MyRoutes.userDetailsScreen: (context) => const UserDetailsScreen(),
        MyRoutes.profileScreen: (context) => ProfileScreen(),
        MyRoutes.howToScreen: (context) => const HowToScreen(),
        MyRoutes.navigateScreen: (context) => const NavigateScreen(),
        MyRoutes.authScreen: (context) => const AuthScreen(),
        MyRoutes.aboutScreen: (context) => const AboutUs(),
        MyRoutes.reportScreen: (context) => const ReportAProblem(),
        MyRoutes.compProfileScreen: (context) => CompProfileScreen(),
      },
      // ),
    );
  }
}
