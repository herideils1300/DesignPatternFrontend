import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImage extends StatelessWidget{
  final double width = 0;
  final double height = 0;
  String assetName = "";

  CustomImage(this.assetName, {super.key, width, height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetName);
  }

}