import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageWidget extends StatelessWidget {
  final String assetName;
  final BoxFit fit;
  final double height;
  final double width;

  const ImageWidget(this.assetName,
      {super.key, 
      this.width = 0, 
      this.height = 0, 
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetName, fit: fit, height: height);
  }
}
