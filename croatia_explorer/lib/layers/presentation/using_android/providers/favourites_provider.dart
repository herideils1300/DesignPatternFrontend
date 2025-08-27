import 'dart:async';

import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/repos/Hive/favouritesRepo.dart';
import 'package:croatia_explorer/layers/domain/_sight.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesProvider extends StateNotifier<List<ModelSight>> {
  final client = SightsClient(Dio(BaseOptions()));
  final FavouritesRepo favRepo = FavouritesRepo("croatia_explorer/lib/localDB");

  FavouritesProvider(super._state);

  void addFavourite(ModelSight sight) {
    favRepo.addFavourite(sight);
  }

  void removeFavourite(String key) {
    favRepo.remove(key);
  }

  void determineFavourite(ModelSight fetchedSight) async {
    Iterable<ModelSight> allFavourites = await favRepo.getAllFavourites();

    if (allFavourites.any((sight) => sight == fetchedSight)) {
      fetchedSight.favourite = true;
    }
  }

  Future<List<ModelSight>> getFavourites() async {
    return favRepo.getAllFavourites();
  }
}

final favouritesScreenStateProvider =
    StateNotifierProvider<FavouritesProvider, List<ModelSight>>((ref) {
  return FavouritesProvider([]);
});
