import 'package:croatia_explorer/layers/data/dto/image_dto.dart';
import 'package:flutter/foundation.dart';

class ImageModel {
  late int index;
  late Uint8List image;
  late double width;
  late double height;
  late int type;

  ImageModel(
    this.index,
    this.image,
    this.width,
    this.height,
    this.type
  );

  factory ImageModel.fromDto(ImageDto dto){
    return ImageModel(dto.index, dto.image, dto.width, dto.height, dto.type);
  }
}
