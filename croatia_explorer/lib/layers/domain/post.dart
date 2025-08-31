import 'dart:typed_data';

class Post {
  String uid;
  String description;
  List<Uint8List> images;
  List<String> hashtags;


  Post({
    required this.uid,
    required this.description,
    required this.images,
    required this.hashtags
  });

  


}