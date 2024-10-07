import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget{
  final double width = 0;
  final double height = 0;
  final String assetName = "";

  const CustomImage(width, height, String assetName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetName);
  }

}