import 'package:json_annotation/json_annotation.dart';

sealed class Sight {}

@JsonSerializable()
class ListSight extends Sight {
  String title = "";
  String address = "";
  double lat = 0.0;
  double lng = 0.0;
  int rating = 0;
  String imageUrl = "";
  bool favourite = false;

  ListSight(this.title, this.address, this.lat, this.lng, this.rating,
      this.imageUrl, this.favourite);
}

@JsonSerializable()
class DetailsSight extends Sight {
  String title = "";
  String adress = "";
  String description = "";
  int rating = 0;
  String imageUrl = "";

  DetailsSight(
      this.title, this.adress, this.rating, this.description, this.imageUrl);
}
