import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/favourites_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/gradients/gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCard extends ConsumerWidget {
  final ListSight sight;

  const CustomCard({super.key, required this.sight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> favouriteNotifier = ValueNotifier(sight.favourite);
    FavouritesProvider favouritesStateProvier = ref.watch(favouritesScreenStateProvider.notifier);
    ValueNotifier<int> ratingNotifier = ValueNotifier(sight.rating);

    List<Widget> stars = <ValueListenableBuilder>[];

    void setStars() {
      for (int i = 0; i < 5; i++) {
        if (i < ratingNotifier.value) {
          stars.add(ValueListenableBuilder(
            builder: (BuildContext context, value, Widget? child) => IconButton(
                onPressed: () => ratingNotifier.value = i + 1,
                icon: Icon(
                  (value > i) ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                )), valueListenable: ratingNotifier,
          ));
        } else {
          stars.add(ValueListenableBuilder(
            builder: (BuildContext context, value, Widget? child) => IconButton(
                onPressed: () => ratingNotifier.value = i + 1,
                icon: Icon(
                  (value > i) ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                )), valueListenable: ratingNotifier,
          ));
        }
      }
    }

    setStars();

    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 132,
        width: 380,
        child: Card(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  gradient: linearGradient(Theme.of(context)),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Row(children: [
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    margin:
                        const EdgeInsets.only(left: 14, top: 14, bottom: 14),
                    child: Image.network(sight.imageUrl,
                        fit: BoxFit.fitHeight, height: 104)),
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sight.title,
                            style: TextStyle(
                                fontSize: (sight.title.length > 20) ? 15 : 20,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left),
                        const Text(
                            "10 000, Zagreb" /*sight.address.substring(sight.address.lastIndexOf(","))*/,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left),
                        Text("${sight.lat}, ${sight.lng}",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left),
                        Row(
                          children: stars,
                        ),
                      ]),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0, top: 10.0),
                    alignment: Alignment.topRight,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ValueListenableBuilder(
                            builder: (context, value, child) => ((value)
                                ? IconButton(
                                    icon: const Icon(Icons.favorite_outlined),
                                    color: Colors.white,
                                    onPressed: () {
                                      favouriteNotifier.value = !value;
                                      sight.favourite = favouriteNotifier.value;
                                      if(favouriteNotifier.value){
                                        favouritesStateProvier.addFavourite(sight);
                                      }else{
                                        favouritesStateProvier.removeFavourite(sight.title);
                                      }
                                      
                                    })
                                : IconButton(
                                    icon: const Icon(Icons.favorite_outline),
                                    color: Colors.white,
                                    onPressed: () {
                                      favouriteNotifier.value = !value;
                                      sight.favourite = favouriteNotifier.value;
                                      if(favouriteNotifier.value){
                                        favouritesStateProvier.addFavourite(sight);
                                      }else{
                                        favouritesStateProvier.removeFavourite(sight.title);
                                      }
                                      
                                    })),
                            valueListenable: favouriteNotifier,
                          )
                        ]),
                  ),
                )
              ]),
            )));
  }
}
