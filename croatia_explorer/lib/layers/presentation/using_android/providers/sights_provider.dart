import 'dart:async';
import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/dto/sight_dto.dart';
import 'package:croatia_explorer/layers/domain/_sight.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SightsProvider extends AsyncNotifier<List<ModelSight>> {
  late final SightsClient client;
  SightsProvider();

  @override
  FutureOr<List<ModelSight>> build() {
    client = SightsClient(Dio(BaseOptions(headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods":
          "GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS",
      "Access-Control-Allow-Headers": "*",
      "Access-Control-Expose-Headers": "Authorization, authenticated",
    }, connectTimeout: const Duration(minutes: 30))));

    return getAllSights();
  }

  Future<List<ModelSight>> getAllSights() async {
    List<SightDto> sightDtos = await client.getAllSights();

    List<ModelSight> listSights = sightDtos.map((element) {
      return ModelSight(element.title, element.address, element.description, element.lat, element.lng,
          element.rating, element.imageUrl, false);
    }).toList();

    return listSights;
  }
}

final sightsScreenStateProvider =
    AsyncNotifierProvider<SightsProvider, List<ModelSight>>(() {
  return SightsProvider();
});
