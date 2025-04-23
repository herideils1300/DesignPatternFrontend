import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeStateWidget extends StatefulWidget {
  const HomeStateWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeStateWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: [ListSight("title", "adress", 0.0, 0.0, 2, "sukPP")],
        future: Future<Iterable<ListSight>>(
            () => [ListSight("title", "adress", 0.0, 0.0, 2, "sukPP")]),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CustomCardState(sight: snapshot.data!.toList()[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error.toString()}",
                style: TextTheme.of(context).bodyMedium);
          } else {
            return Lottie.asset("lib/assets/animations/loading_sights.json");
          }
        });
  }
}
