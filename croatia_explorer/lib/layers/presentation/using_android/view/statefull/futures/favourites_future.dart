import 'package:croatia_explorer/layers/presentation/using_android/providers/favourites_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class FavouritesFuture extends ConsumerStatefulWidget {
  const FavouritesFuture({super.key});

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
        return Text("Error: ${snapshot.error}", style: Theme.of(context).textTheme.displayMedium);
      }else{
        return Container(
              width: 75,
              height: 75,
              margin: const EdgeInsets.only(top: 20),
              child: Lottie.asset("lib/assets/animations/loading_sights.json",
                  alignment: Alignment.center),
            );
      }
    });
  }

}