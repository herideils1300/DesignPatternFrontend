
import 'package:croatia_explorer/layers/presentation/using_android/view/statefull/main/futures/sights_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeStateWidget extends ConsumerStatefulWidget {
  const HomeStateWidget({super.key});

  @override
  ConsumerState<HomeStateWidget> createState() {
    return HomeState();
  }
}

class HomeState extends ConsumerState<HomeStateWidget> {

  @override
  Widget build(BuildContext context) {
    return const SightsFuture();
  }
}

