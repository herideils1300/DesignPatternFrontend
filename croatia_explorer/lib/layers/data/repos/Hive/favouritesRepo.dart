// ignore: file_names

import 'package:croatia_explorer/layers/application/cachers/hive_multicache.dart';
import 'package:croatia_explorer/layers/domain/_sight.dart';

class FavouritesRepo {
  final boxName = "sightsBox";
  late Cacher<ModelSight> hiveCache;

  FavouritesRepo(String path) {
    hiveCache = Cacher<ModelSight>();
  }

  void remove(String key){
    hiveCache.remove(key);
  }

  Future<List<ModelSight>> getAllFavourites() async {
    await hiveCache.createOrOpen(boxName);

    Iterable<ModelSight> iterable = hiveCache.extractAll(boxName);
    
    late List<ModelSight> favourites;
    if (iterable.isNotEmpty) {
      favourites = iterable.toList();
    } else {
      return [];
    }

    return favourites;
  }

  void addFavourite(ModelSight sight) async {
    await hiveCache.createOrOpen(boxName);
    hiveCache.save(sight.title, sight);
  }
}
