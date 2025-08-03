import 'dart:js_interop';

import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/repos/Hive/favouritesRepo.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers_and_notifiers/sights_screen_state_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesScreenStateNotifier extends StateNotifier<List<ListSight>> {
  final client = SightsClient(Dio(BaseOptions()));
  final FavouritesRepo favRepo = FavouritesRepo("croatia_explorer/lib/localDB");
  List<ListSight> favourites = [];
  
  FavouritesScreenStateNotifier(super.state);

  void sortFavourites(List<ListSight> plainSights) async {
    for (ListSight a in plainSights) {
      if(a.favourite){
        favRepo.addFavourite(a);
      }
    }
  }

  Future<Iterable<ListSight>> getFavourites() async {
    return favRepo.getAllFavourites();
  }


}

final favouritesScreenStateProvider = StateNotifierProvider<FavouritesScreenStateNotifier, List<ListSight>>((ref) {
  final sightsScreenStateNotifier = ref.watch(sightsScreenStateProvider.notifier);

  return FavouritesScreenStateNotifier(sightsScreenStateNotifier.sights);
});