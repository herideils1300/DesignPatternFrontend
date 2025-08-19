import 'package:hive_flutter/adapters.dart';

part '../domain/adapters/sight.g.dart';

@HiveType(typeId: 1)
class ModelSight {
  @HiveField(0)
  String title = "";
  @HiveField(1)
  String description = "";
  @HiveField(2)
  String address = "";
  @HiveField(3)
  double lat = 0.0;
  @HiveField(4)
  double lng = 0.0;
  @HiveField(5)
  int rating = 0;
  @HiveField(6)
  String imageUrl = "";
  @HiveField(7)
  bool favourite = false;

  ModelSight(this.title, this.address, this.description, this.lat, this.lng, this.rating,
      this.imageUrl, this.favourite);
}
