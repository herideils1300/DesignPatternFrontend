import 'dart:typed_data';

import 'package:croatia_explorer/layers/domain/image.dart';
import 'package:flutter/material.dart';

class Post {
  String uid;
  String description;
  List<ImageModel> images;
  List<String> hashtags;


  Post({
    required this.uid,
    required this.description,
    required this.images,
    required this.hashtags
  });

  


}