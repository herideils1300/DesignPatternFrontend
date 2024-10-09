import 'package:croatia_explorer/layers/presentation/shared/image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(primary: true, automaticallyImplyLeading: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage("lib/assets/images/camping_image.png"),
          Container(
            width: 103,
            margin: const EdgeInsets.only(top: 20),
            child: Lottie.asset("lib/assets/animations/loading_dots.json",
                alignment: Alignment.center),
          )
        ],
      ),
    );
  }
}
