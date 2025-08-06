import 'package:croatia_explorer/layers/presentation/using_android/view/statefull/futures/favourites_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesStateWidget extends ConsumerStatefulWidget {
  const FavouritesStateWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FavouritesState();
  }


}


class _FavouritesState extends ConsumerState<FavouritesStateWidget> {
  @override
  Widget build(BuildContext context) {
    return const FavouritesFuture();
  }
}