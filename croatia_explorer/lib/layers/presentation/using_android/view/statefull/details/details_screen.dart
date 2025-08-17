import 'package:croatia_explorer/layers/application/clients/abstract/sight_client.dart';
import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerWidget {
  SightsClient client = new SightsClient(Dio(BaseOptions(headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods":
          "GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS",
      "Access-Control-Allow-Headers": "*",
      "Access-Control-Expose-Headers": "Authorization, authenticated",
    })));
    ModelSight sight;

    DetailsScreen({super.key, required this.sight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Align(alignment: Alignment.topCenter, child: Image.network(sight.imageUrl, fit: BoxFit.cover)),
    );
  }
}