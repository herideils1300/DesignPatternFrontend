// ignore: file_names

import 'package:croatia_explorer/layers/application/cachers/hive_multicache.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';

class FavouritesRepo {
  final boxName = "sightsBox";
  late Multicache<ListSight> hiveMulticache;

  FavouritesRepo(String path) {
    hiveMulticache = Multicache<ListSight>();
  }

  Iterable<ListSight> getAllFavourites() {
    hiveMulticache.createOrOpen(boxName);

    Iterable<ListSight> iterable = hiveMulticache.extractAll(boxName);
    
    late List<ListSight> favourites;
    if (iterable.isNotEmpty) {
      favourites = hiveMulticache.extractAll(boxName).toList();
    } else {
      return [];
    }

    return favourites;
  }

  void addFavourite(ListSight sight) {
    hiveMulticache.createOrOpen(boxName);
    hiveMulticache.save(boxName, sight.title, sight);
  }
}
