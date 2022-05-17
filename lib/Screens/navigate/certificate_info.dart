import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class CertificateInfo extends StatefulWidget {
  const CertificateInfo({Key? key}) : super(key: key);

  @override
  State<CertificateInfo> createState() => _CertificateInfoState();
}

class _CertificateInfoState extends State<CertificateInfo> {
  String? name;
  String? batchNo;
  String? date;
  String? vacStatus;
  @override
  Widget build(BuildContext context) {
    if (loggedUser!.vaccinesGiven.isNotEmpty) {
      name = loggedUser!.vaccinesGiven[0].vaccineId;
      batchNo = loggedUser!.vaccinesGiven[0].batchNumber;
      date = loggedUser!.vaccinesGiven[0].vaccineDate;
      vacStatus = loggedUser!.vacStatus;
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? vacAuthCode = loggedUser!.vacAuthCode;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50.0, 0, 50),
                alignment: Alignment.center,
                child: const Text.rich(
                  TextSpan(
                    text: 'My Certificate',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Card(
                child: Column(children: [
                  const FieldNameText(fieldText: 'Vaccine Name'),
                  FieldValue(val: name),
                  const FieldNameText(fieldText: 'Date Given'),
                  FieldValue(val: date),
                  const FieldNameText(fieldText: 'Batch No'),
                  FieldValue(val: batchNo),
                  const FieldNameText(fieldText: 'Vaccination Status'),
                  FieldValue(val: vacStatus),
                ]),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: height * 0.07,
                  width: width - 50,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: kindaYellow,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    child: const Text(
                      "Share",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class FieldValue extends StatelessWidget {
  const FieldValue({required this.val});

  final String? val;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          AutoSizeText(
            val != null ? val as String : 'null',
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: blacky),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
            height: 5,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class FieldNameText extends StatelessWidget {
  final String fieldText;

  const FieldNameText({Key? key, required this.fieldText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      fieldText,
      minFontSize: 18.0,
      style: const TextStyle(fontWeight: FontWeight.w500, color: theGrey),
    );
  }
}
