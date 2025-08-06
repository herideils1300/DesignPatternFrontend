import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/data/dto/sight_dto.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:dart_class_mapper/dart_class_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SightsProvider extends StateNotifier<List<ListSight>> {
  final client = SightsClient(Dio(BaseOptions(headers: {
    "Access-Control-Allow-Origin" : "*",
    "Access-Control-Allow-Methods" : "GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS"
  })));
  List<ListSight> sights = [];
  SightsProvider(super.state);

  List<ListSight> regetSights(){
    return sights;
  }

  Future<List<ListSight>> getAllSights({bool allowSet = false}) async {
    GetMapper<ListSight, SightDto> mapper = GetMapper<ListSight, SightDto>();
    final sightsDto = await client.getAllSights();
    List<ListSight> listSights = mapper.list(sightsDto);
    if (allowSet) {
      sights = listSights;
    }
    return listSights;
  }
}

final sightsScreenStateProvider =
    StateNotifierProvider((ref) => SightsProvider([]));
