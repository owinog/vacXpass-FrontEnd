import 'package:flutter/material.dart';
import 'package:vacxpass_front/Utilities/constants.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';
import 'package:vacxpass_front/components/backButton.dart';

class DownloadCertificate extends StatelessWidget {
  const DownloadCertificate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Center(
                      child: Image.asset(
                        downloadImage,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(height: 08),
                    Center(
                      child: SizedBox(
                        height: height * 0.06,
                        width: 200,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kindaYellow,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: const Text(
                            "Download PDF",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        facebookImage,
                        height: 56,
                        width: 56,
                      ),
                    ),
                    const SizedBox(height: 08),
                    Center(
                      child: SizedBox(
                        height: height * 0.06,
                        width: 200,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kindaYellow,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: const Text(
                            "Share in Facebook",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        whatsappImage,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(height: 08),
                    Center(
                      child: SizedBox(
                        height: height * 0.06,
                        width: 200,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kindaYellow,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: const Text(
                            "Share in WhatsApp",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        telegramImage,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(height: 08),
                    Center(
                      child: SizedBox(
                        height: height * 0.06,
                        width: 200,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kindaYellow,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: const Text(
                            "Share in Telegram",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
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
            const backButton(),
          ],
        ),
      ),
    );
  }
}
