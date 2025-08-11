import 'package:croatia_explorer/layers/presentation/using_android/providers/sights_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SightsFuture extends ConsumerStatefulWidget {
  const SightsFuture({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SightsFutureWidget();
}

class SightsFutureWidget extends ConsumerState<SightsFuture> {

  late SightsProvider notifier;

  @override
  void initState() {
    notifier = ref.read(sightsScreenStateProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref.watch(sightsScreenStateProvider.future),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (context, index) {
              return CustomCard(sight: snapshot.data![index]);
            });
          } else if (snapshot.hasError) {
            throw Exception(snapshot.error);
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
