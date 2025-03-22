import 'package:croatia_explorer/layers/domain/User.dart';
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
    return Column(children: [
      Text("Places", style: Theme.of(context).textTheme.titleLarge),
      FutureBuilder(
          future: Future<List<UserDto>>(() => []),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return null;
              });
            }else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }else{
              return Lottie.asset("lib/assets/animations/loading_sights.json");
            }
          })
    ]);
  }
}
