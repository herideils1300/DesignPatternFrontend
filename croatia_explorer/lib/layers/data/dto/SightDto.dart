import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SightDto{
  int id = 0;
  String title = "";
  String description = "";
  String adress = "";
  double lat = 0.0;
  double lng = 0.0;
  int rating = 0;
  String imageUrl = "";
}