import 'package:croatia_explorer/layers/domain/_sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/favourites_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sight = (ModalRoute.of(context)!.settings.arguments as ModelSight);
    ValueNotifier<ModelSight> sightChangedNotifier =
        ValueNotifier<ModelSight>(sight);
    Image image = Image.network(sight.imageUrl, fit: BoxFit.fill);

    List<Icon> starIcons = <Icon>[];

    for (int i = 0; i < 5; i++) {
      if (i < sight.rating) {
        starIcons.add(const Icon(Icons.star));
      } else {
        starIcons.add(const Icon(Icons.star_border));
      }
    }

    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: sightChangedNotifier,
        builder: (context, value, child) => FloatingActionButton(
          onPressed: () {
            sightChangedNotifier.value.favourite =
                !sightChangedNotifier.value.favourite;
            if (sight.favourite) {
              ref
                  .read(favouritesScreenStateProvider.notifier)
                  .addFavourite(sight);
            } else {
              ref
                  .read(favouritesScreenStateProvider.notifier)
                  .removeFavourite(sight.title);
            }
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.black, // <-- Button color
          child: Icon(
              (value.favourite) ? Icons.favorite : Icons.favorite_border,
              color: Colors.white),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.66,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white),
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(sight.title,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("10 000 Zagreb",
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 22),
                  const Text(
                    "Rating",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  Row(
                    children: starIcons,
                  ),
                  const SizedBox(height: 25),
                  Text(sight.description,
                      style: Theme.of(context).textTheme.bodySmall),
                  const Expanded(child: SizedBox()),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonWidget(
                          onPressed: () {
                            url_launcher.launchUrl(Uri.parse(
                                "https://www.google.com/maps/search/@${sight.lat},${sight.lng}"));
                          },
                          textContent: "Show on maps",
                          marginInsets: EdgeInsets.zero))
                ],
              ),
            )),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Stack(fit: StackFit.passthrough, children: [
                image,
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: IconButton(
                      alignment: const Alignment(15, 0),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Container(
                        width: 50,
                        height: 50,
                          decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.dstIn,
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.secondary
                              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                          child: const Icon(Icons.arrow_back_ios_new, blendMode: BlendMode.modulate,))),
                ),
              ]))),
    );
  }
}
