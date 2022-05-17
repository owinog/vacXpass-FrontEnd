import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/constants.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/components/backButton.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 50.0),
                child: Column(children: [
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'About Us',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 40.0,
                    ),
                    child: Image.asset(
                      bgImage,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Column(children: const [
                    ParagraphText(
                      'VacxPass is a virtual vaccine certificate wallet that ensures data security and credibility.',
                    ),
                    ParagraphText(
                      'Being digital and credible with the help of blockchain technology this could be used anywhere around the world.',
                    ),
                    ParagraphText(
                      'By elimination of the usage of falsified certificates to enter public places where vaccination is required, the risk of corona virus spread can be prevented.',
                    ),
                    SubHeading(
                      'Mission',
                    ),
                    ParagraphText(
                        'Providing a Platform to safely share vaccination records to facilitate in safe association of users in public while protecting their privacy.'),
                    SubHeading('Team'),
                    ParagraphText(
                      'vodka-Labs\nGroup No : SE-51',
                    ),
                    ParagraphText(
                      'Project : VacXpass (Blockchain Based Vaccination Passport System)',
                    ),
                    SubHeading(
                      'Members',
                    ),
                    ParagraphText(
                      'Vihanga Ruwanpathirana(L)\n20200183 - w1809986',
                    ),
                    ParagraphText(
                      'Owin Gunawardena\n2019412 - w1761343',
                    ),
                    ParagraphText(
                      'Ashfaque Yoosuff\n20200908 - w1838857',
                    ),
                    ParagraphText(
                      'Dinusha Amarasinghe\n2019200 - w1809751',
                    ),
                    ParagraphText(
                      'Kumaran Arunasalam\n20201005 - w1839503',
                    ),
                  ])
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

class SubHeading extends StatelessWidget {
  final String data;
  const SubHeading(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30.0,
      ),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: blacky,
        ),
      ),
    );
  }
}

class ParagraphText extends StatelessWidget {
  final String data;
  const ParagraphText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
          color: blacky,
        ),
      ),
    );
  }
}
