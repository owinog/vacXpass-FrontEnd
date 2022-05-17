import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vacxpass_front/Utilities/myappcolors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whitey,
      child: const Center(
        child: SpinKitChasingDots(
          color: kindaYellow,
        ),
      ),
    );
  }
}
