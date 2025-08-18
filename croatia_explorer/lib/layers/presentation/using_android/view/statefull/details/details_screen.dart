import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerWidget {

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ModelSight sight =
        (ModalRoute.of(context)!.settings.arguments as ModelSight);
    return Scaffold(
      body: Align(
          alignment: Alignment.topCenter,
          child: Image.network(sight.imageUrl, fit: BoxFit.cover)),
    );
  }
}
