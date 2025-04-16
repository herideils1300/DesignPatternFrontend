class ListSight{
  String title = "";
  String adress = "";
  double lat = 0.0;
  double lng = 0.0;
  int rating = 0;
  String imageUrl = "";

  ListSight(this.title, this.adress, this.lat, this.lng, this.rating, this.imageUrl);
}

class DetailsSight{
  String title = "";
  String adress = "";
  String description = "";
  int rating = 0;
  String imageUrl = "";

  DetailsSight(this.title, this.adress, this.rating, this.description, this.imageUrl);
}