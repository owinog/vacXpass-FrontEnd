import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/components/backButton.dart';

class ReportAProblem extends StatefulWidget {
  const ReportAProblem({Key? key}) : super(key: key);

  @override
  State<ReportAProblem> createState() => _ReportAProblemState();
}

class _ReportAProblemState extends State<ReportAProblem> {
  TextEditingController titleStr = TextEditingController();
  TextEditingController problemStr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String txtT = "";
    String txtP = "";
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 90.0, 0, 50),
                      child: const Text.rich(
                        TextSpan(
                          text: 'Report a Problem',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    TextField(
                      controller: titleStr,
                      autocorrect: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Title',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: problemStr,
                      autocorrect: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 150, bottom: 150),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        height: height * 0.08,
                        width: width - 50,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kindaYellow,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                          child: const Text(
                            "Send",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: blacky),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const backButton(),
          ],
        ),
      ),
    );
  }
}
