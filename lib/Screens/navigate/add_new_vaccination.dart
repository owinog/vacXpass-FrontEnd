import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
import 'package:vacxpass_front/Utilities/loading.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/components/reusableElevatedButton.dart';

class AddNewVaccine extends StatefulWidget {
  const AddNewVaccine({Key? key}) : super(key: key);

  @override
  State<AddNewVaccine> createState() => _AddNewVaccineState();
}

class _AddNewVaccineState extends State<AddNewVaccine> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? vacAuthCode = '';

    return loading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 50),
                          child: const Text.rich(
                            TextSpan(
                              text: 'Add New Vaccination',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 30.0),
                          child: const Text.rich(
                            TextSpan(
                              text: 'Enter Vaccination Code',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        TextFormField(
                          onChanged: (val) async {
                            vacAuthCode = val;
                          },
                          validator: (val) => val!.length != 7
                              ? 'Enter Vaccination code'
                              : null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15.0),
                            labelText: 'Vaccination Code',
                            labelStyle: const TextStyle(
                              color: greyText,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: theGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: theGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: theGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: theGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        // TextField(
                        //   onChanged: (val) {
                        //     setState(() {
                        //       vacAuthCode = val;
                        //     });
                        //   },
                        //   autocorrect: true,
                        //   textAlign: TextAlign.center,
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //     ),
                        //     hintText: 'Binding Code',
                        //   ),
                        // ),
                        const SizedBox(height: 100),
                        ReusableElevatedButton(
                            buttonText: 'Add',
                            onPressed: () async {
                              if (formKey.currentState != null
                                  ? formKey.currentState!.validate()
                                  : false) {
                                setState(() {
                                  loggedUser!.vacAuthCode = vacAuthCode;
                                  // loading = true;
                                });
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
