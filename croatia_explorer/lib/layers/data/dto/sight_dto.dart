import 'package:json_annotation/json_annotation.dart';
part 'implementations/sight_dto.g.dart';

@JsonSerializable()
class SightDto{
  int id;
  String title;
  String description;
  String address;
  double lat;
  double lng;
  int rating;
  String imageUrl;

  SightDto({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.lat,
    required this.lng,
    required this.rating,
    required this.imageUrl
  });

  factory SightDto.fromJson(Map<String, dynamic> json) => _$SightDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SightDtoToJson(this);



}