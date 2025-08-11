import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/repos/Hive/favouritesRepo.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/sights_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesProvider extends StateNotifier<List<ListSight>> {
  final client = SightsClient(Dio(BaseOptions()));
  final FavouritesRepo favRepo = FavouritesRepo("croatia_explorer/lib/localDB");
  List<ListSight> favourites = [];
  
  FavouritesProvider(super.state);

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

final favouritesScreenStateProvider = StateNotifierProvider<FavouritesProvider, List<ListSight>>((ref) {
  final sightsScreenStateNotifier = ref.watch(sightsScreenStateProvider);

  return FavouritesProvider((sightsScreenStateNotifier.hasValue) ? sightsScreenStateNotifier.value!: List.empty());
});