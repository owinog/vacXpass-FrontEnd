import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/components/backButton.dart';

class HowToScreen extends StatefulWidget {
  const HowToScreen({Key? key}) : super(key: key);

  @override
  State<HowToScreen> createState() => _HowToScreenState();
}

class _HowToScreenState extends State<HowToScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 80.0, 0, 10),
                    child: const AutoSizeText(
                      'How to Use',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 30.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        PointText(
                          textLine: '1. Register',
                          fontWeight: FontWeight.w500,
                        ),
                        PointText(
                          textLine: '- Enter Email and New Password',
                        ),
                        PointText(
                          textLine: '- Go to mailbox and go to the to verify. ',
                        ),
                        PointText(
                          textLine: '- Go to profile page',
                        ),
                        PointText(
                          textLine:
                              '- Enter User Details to complete registration',
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        PointText(
                          textLine: '2. Add New Vaccination',
                          fontWeight: FontWeight.w500,
                        ),
                        PointText(
                          textLine:
                              '- If you did not enter user details you will be asked to do so before you can add a certificate',
                        ),
                        PointText(
                          textLine:
                              '- Recieve your code after you get vaccinated from the center',
                        ),
                        PointText(
                          textLine:
                              '- Enter the Code in the text field to add to your certificate',
                        ),
                        PointText(
                          textLine:
                              '- View Your Cetificate in the Certificate tab',
                        ),
                        PointText(
                          textLine: 'Use Your Cetificate around the world',
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const backButton()
        ]),
      ),
    );
  }
}

class PointText extends StatelessWidget {
  final String textLine;
  final FontWeight fontWeight;

  const PointText(
      {required this.textLine, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: AutoSizeText(
        textLine,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 20,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
