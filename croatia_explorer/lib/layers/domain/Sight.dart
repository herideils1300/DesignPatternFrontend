import 'package:hive_flutter/adapters.dart';

part "../domain/adapters/sight.g.dart";

@HiveType(typeId: 1)
class ListSight {
  @HiveField(0)
  String title = "";
  @HiveField(1)
  String address = "";
  @HiveField(2)
  double lat = 0.0;
  @HiveField(3)
  double lng = 0.0;
  @HiveField(4)
  int rating = 0;
  @HiveField(5)
  String imageUrl = "";
  @HiveField(6)
  bool favourite = false;

  ListSight(this.title, this.address, this.lat, this.lng, this.rating,
      this.imageUrl, this.favourite);
}

class DetailsSight {
  String title = "";
  String adress = "";
  String description = "";
  int rating = 0;
  String imageUrl = "";

  DetailsSight(
      this.title, this.adress, this.rating, this.description, this.imageUrl);
}
