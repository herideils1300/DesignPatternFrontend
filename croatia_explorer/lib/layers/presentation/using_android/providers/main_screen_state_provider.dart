import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/dto/sight_dto.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/statefull/main/states/main_screen_state.dart';
import 'package:dart_class_mapper/dart_class_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class MainScreenStateNotifier extends StateNotifier<MainScreenState> {
  final client = SightsClient(Dio(BaseOptions()));
  MainScreenStateNotifier() : super(LoadedSightsMain([]));

  void switchScreen(int index) async {
    List<SightDto> sightsDto = await client.getAllSights();
    List<ListSight> sights = sightsDto.map((a) => GetMapper<ListSight, SightDto>().value(a)).toList();

    switch (index) {
      case 0:
        state = LoadedSightsMain(sights);
        break;
      case 1:
        state = LoadedFavouritesMain([]);
        break;
      case 2:
        state = LoadedProfileMain();
        break;
      default:
        state = ErrorMain("Index for states out of range!");
        break;
    }
  }
}


final mainScreenStateProvider = StateNotifierProvider<MainScreenStateNotifier, MainScreenState>((ref) => MainScreenStateNotifier()).;
