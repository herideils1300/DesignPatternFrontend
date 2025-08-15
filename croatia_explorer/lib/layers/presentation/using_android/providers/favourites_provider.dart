import 'dart:async';

import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/repos/Hive/favouritesRepo.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesProvider extends AsyncNotifier<List<ListSight>> {
  final client = SightsClient(Dio(BaseOptions()));
  final FavouritesRepo favRepo = FavouritesRepo("croatia_explorer/lib/localDB");
  
  FavouritesProvider();

  void addFavourite(ListSight sight){
    favRepo.addFavourite(sight);
  }

  void determineFavourites(List<ListSight> fetchedSights) async {
    Iterable<ListSight> allFavourites = favRepo.getAllFavourites();

    for (var plainSight in fetchedSights) {
      if(allFavourites.any((favourite) => favourite == plainSight)){
        plainSight.favourite = true;
      }
    }
    
  }
  FutureOr<List<ListSight>> _getFavourites() {
    return favRepo.getAllFavourites().toList();
  }

  @override
  FutureOr<List<ListSight>> build() {
    return _getFavourites();
  }


}

final favouritesScreenStateProvider = AsyncNotifierProvider<FavouritesProvider, List<ListSight>>(() {
  return FavouritesProvider();
});