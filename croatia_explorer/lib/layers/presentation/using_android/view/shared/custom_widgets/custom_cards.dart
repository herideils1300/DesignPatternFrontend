
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/gradients/gradient.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ListSight sight;

  const CustomCard({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = <Widget>[];

    for (int i = 0; i < 5; i++) {
      stars.add((i <= sight.rating)
          ? const Icon(Icons.star, color: Colors.yellow)
          : const Icon(Icons.star_border));
    }

    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0))),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 132,
        child: Card(
            color: Colors.transparent,
            child: Container(
              decoration:
                  BoxDecoration(gradient: linearGradient(Theme.of(context)), borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Row(children: [
                Container(
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                  margin: const EdgeInsets.only(left: 14, top: 14, bottom: 14),
                  child: Image.network(sight.imageUrl, fit: BoxFit.fitHeight, height: 104)),
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(sight.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700), textAlign: TextAlign.left),
                    Text("10 000, Zagreb" /*sight.address.substring(sight.address.lastIndexOf(","))*/, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700), textAlign: TextAlign.left),
                    Text("${sight.lat}, ${sight.lng}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400), textAlign: TextAlign.left),
                    Row(
                      children: stars,
                    ),
                  ]),
                ),
              ]),
            )));
  }
}
