import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:flutter/material.dart';

class CustomCardState extends StatelessWidget {
  final ListSight sight;

  const CustomCardState({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = <Widget>[];

    for (int i = 0; i < 5; i++) {
      stars.add((i <= sight.rating)
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border));
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Card(
            child: Row(children: [
          Image.network(sight.imageUrl),
          Column(children: [
            Text(sight.title),
            Text(sight.adress),
            Text("${sight.lat}, ${sight.lng}"),
            Row(
              children: stars,
            ),
          ]),
          Column(
            children: stars,
          )
        ])));
  }
}
