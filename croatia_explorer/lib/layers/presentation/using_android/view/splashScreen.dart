import 'package:croatia_explorer/layers/presentation/shared/appBar.dart';
import 'package:croatia_explorer/layers/presentation/shared/image.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SplashScreenState();

}


class SplashScreenState extends State<SplashScreenWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(context),
    body: const Column(children: [
      CustomImage(375, 282.64, "camping_image.png")
    ],),
    );
  }

}