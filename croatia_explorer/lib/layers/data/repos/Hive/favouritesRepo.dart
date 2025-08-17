// ignore: file_names

import 'package:croatia_explorer/layers/application/cachers/hive_multicache.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';

class FavouritesRepo {
  final boxName = "sightsBox";
  late Cacher<ListSight> hiveCache;

  FavouritesRepo(String path) {
    hiveCache = Cacher<ListSight>();
  }

  void remove(String key){
    hiveCache.remove(key);
  }

  Future<List<ListSight>> getAllFavourites() async {
    await hiveCache.createOrOpen(boxName);

    Iterable<ListSight> iterable = hiveCache.extractAll(boxName);
    
    late List<ListSight> favourites;
    if (iterable.isNotEmpty) {
      favourites = iterable.toList();
    } else {
      return [];
    }

    return favourites;
  }

  void addFavourite(ListSight sight) async {
    await hiveCache.createOrOpen(boxName);
    hiveCache.save(sight.title, sight);
  }
}
