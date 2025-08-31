import 'dart:typed_data';

class PostDto {
  int id;
  String uid;
  String description;
  List<Uint8List> images;
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
        
      }),
      'hashtags' : hashtags,
    };
  }
}
