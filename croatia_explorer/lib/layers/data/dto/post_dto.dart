
import 'package:croatia_explorer/layers/data/dto/image_dto.dart';

class PostDto {
  int id;
  String uid;
  String description;
  List<ImageDto> images;
  List<String> hashtags;

  PostDto({
    required this.id,
    required this.uid,
    required this.description,
    required this.images,
    required this.hashtags,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
        id: json['id'],
        uid: json['uid'],
        description: json['description'],
        images: json['images'],
        hashtags: json['hashtags']);
  }
  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'uid' : uid,
      'description' : description,
      'images' : images.map((element){
        return element.toJson();
      }).toList(),
      'hashtags' : hashtags,
    };
  }
}
