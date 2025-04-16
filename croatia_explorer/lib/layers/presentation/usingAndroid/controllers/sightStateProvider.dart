import 'package:croatia_explorer/layers/application/clients/abstract/sightClient.dart';
import 'package:croatia_explorer/layers/data/dataSources/sight.dart';
import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class HomeStateProvider {
  List<ListSight> state = [];

  void getListSights() async {
    SightClient client = SightClient(Dio(sightBaseOptions));
  }
  
}
