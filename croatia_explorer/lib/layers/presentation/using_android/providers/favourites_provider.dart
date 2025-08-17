import 'dart:async';

import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/repos/Hive/favouritesRepo.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesProvider extends StateNotifier<List<ListSight>> {
  final client = SightsClient(Dio(BaseOptions()));
  final FavouritesRepo favRepo = FavouritesRepo("croatia_explorer/lib/localDB");
  
  FavouritesProvider(super._state);

  void addFavourite(ListSight sight){
    favRepo.addFavourite(sight);
  }

  void removeFavourite(String key){
    favRepo.remove(key);
  }

  void determineFavourites(List<ListSight> fetchedSights) async {
    Iterable<ListSight> allFavourites = await favRepo.getAllFavourites();

    for (var plainSight in fetchedSights) {
      if(allFavourites.any((favourite) => favourite == plainSight)){
        plainSight.favourite = true;
      }
    }
    
  }
  Future<List<ListSight>> getFavourites() async {
    return favRepo.getAllFavourites();
  }


}

final favouritesScreenStateProvider = StateNotifierProvider<FavouritesProvider, List<ListSight>>((ref) {
  return FavouritesProvider([]);
});