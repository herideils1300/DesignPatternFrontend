import 'package:croatia_explorer/layers/presentation/using_android/providers/favourites_screen_state_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SightsFuture extends ConsumerStatefulWidget{
  @override
  State<StatefulWidget> createState() => SightsFutureWidget();
}

class SightsFutureWidget extends ConsumerState<SightsFuture>{
  
  @override
  Widget build(BuildContext context) {
    final future = ref.watch(favouritesScreenStateProvider);
    final futureNotifier = ref.watch(favouritesScreenStateProvider.notifier);

    return FutureBuilder(future: future, builder: builder)
  }

}