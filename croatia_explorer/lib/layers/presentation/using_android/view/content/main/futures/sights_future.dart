import 'package:croatia_explorer/layers/presentation/using_android/providers/favourites_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/sights_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/custom_cards.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SightsFuture extends ConsumerStatefulWidget {
  const SightsFuture({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SightsFutureState();
}

class SightsFutureState extends ConsumerState<SightsFuture> {
  late SightsProvider notifier;
  late FavouritesProvider favouritesNotifier;

  @override
  void initState() {
    notifier = ref.read(sightsScreenStateProvider.notifier);
    favouritesNotifier = ref.read(favouritesScreenStateProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref.watch(sightsScreenStateProvider.future),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  favouritesNotifier.determineFavourite(snapshot.data![index]);
                  return CustomCard(sight: snapshot.data![index]);
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageWidget("lib/assets/images/error_404_image.png"),
                  Text(
                    "There was an error.",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black),
                  ),
                  Text(
                    "Please try again later or check your internet connection.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.black),
                  )
                ],
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text("No places yet. :)"));
          } else {
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
