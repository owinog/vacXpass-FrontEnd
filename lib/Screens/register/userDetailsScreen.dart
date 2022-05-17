import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
// import 'package:vacxpass_front/Services/database.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/Utilities/routes.dart';
import 'package:vacxpass_front/components/backButton.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';
import 'package:vacxpass_front/components/textFieldReusable.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  // final DatabaseService _databaseService =
  //     DatabaseService(uid: loggedUser?.uid);
  final _formKey = GlobalKey<FormState>();

  String? name = '';
  String? nic = '';
  String? dob = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 50),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 5.0),
                    child: const AutoSizeText(
                      'User Details',
                      maxFontSize: 36.0,
                      minFontSize: 24.0,
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        color: blacky,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextFieldReusable(
                    fieldLabelText: 'Full Name',
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    validator: (val) => val!.isEmpty ? 'Enter Full Name' : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldReusable(
                    fieldLabelText: 'NIC/Passport No.',
                    onChanged: (val) {
                      setState(() {
                        nic = val;
                      });
                    },
                    validator: (val) =>
                        val!.length != 10 ? 'Enter NIC/PassportNo' : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldReusable(
                    fieldLabelText: 'Date of Birth yyyy-mm-dd',
                    onChanged: (val) {
                      setState(() {
                        dob = val;
                      });
                    },
                    validator: (val) =>
                        val!.isEmpty ? 'Enter Date of Birth ' : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ReusableElevatedButton(
                    buttonText: 'Submit',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // await _databaseService.updateUserData(
                        //     name: name, nic: nic, dob: dob);

                        Navigator.pushNamedAndRemoveUntil(
                            context, MyRoutes.authScreen, (route) => false);
                      }
                    },
                  ),
                ]),
              ),
            ),
          ),
          const backButton()
        ]),
      ),
    );
  }
}
