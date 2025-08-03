import 'package:croatia_explorer/layers/presentation/using_android/providers_and_notifiers/favourites_screen_state_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class FavouritesFuture extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FavouritesState();

}

class FavouritesState extends ConsumerState<FavouritesFuture>{
  @override
  Widget build(BuildContext context) {
    final favouritesNotifier = ref.watch(favouritesScreenStateProvider.notifier);

    return FutureBuilder(future: favouritesNotifier.getFavourites(), builder: (context, snapshot) {
      if(snapshot.hasData){
        return ListView.builder(itemBuilder: (context, index){
          return CustomCard(sight: snapshot.data!.toList()[index]);
        });
      }else if(snapshot.hasError){
        return Text("Error: ${snapshot.error}");
      }else{
        return LottieBuilder.asset("loading_sights.json");
      }
    });
  }

}