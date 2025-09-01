import 'package:flutter/foundation.dart';

class ImageDto {
  late int id;
  late int index;
  late Uint8List image;
  late double width;
  late double height;
  late int type;

  ImageDto(this.id, this.index, this.image, this.width, this.height, this.type);

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(json['id'], json['index'], json['image'], json['width'], json['height'],
        json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'image': image,
      'width': width,
      'height': height,
      'type': type
    };
  }
}
