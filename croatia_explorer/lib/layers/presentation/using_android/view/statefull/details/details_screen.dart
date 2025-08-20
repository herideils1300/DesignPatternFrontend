import 'package:croatia_explorer/layers/domain/_sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sight = (ModalRoute.of(context)!.settings.arguments as ModelSight);

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
      persistentFooterButtons: const [],
      floatingActionButton: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {Navigator.of(context).pop();},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.white, // <-- Button color
            foregroundColor: Colors.black,
            alignment: Alignment.center // <-- Splash color
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
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
                            url_launcher.launchUrl(Uri.parse("https://www.google.com/maps/search/@${sight.lat},${sight.lng}"));
                          },
                          textContent: "Show on maps",
                          marginInsets:
                              EdgeInsets.zero))
                ],
              ),
            )),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(width: MediaQuery.sizeOf(context).width, child: image)),
    );
  }
}
