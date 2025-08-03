import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/custom_cards.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/statefull/main/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

sealed class MainScreenState extends ConsumerState<MainScreenWidget> {}

class LoadingMain extends MainScreenState {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset("lib/assets/animations/loading_sights.json");
  }
}

class LoadedSightsMain extends MainScreenState {
  final List<ListSight> sights;
  final AsyncSnapshot snapshot;
  LoadedSightsMain(this.sights, this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return CustomCard(sight: snapshot.data!.toList()[index]);
      },
    );
  }
}

class LoadedProfileMain extends MainScreenState {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("My Profile", style: Theme.of(context).textTheme.titleLarge),
        Container(margin: CustomSharedConstants.boxInsets(20, 20), child: Image.network("")),
        const Text("John Doe"),
        const Text("john.doe@example.com"),
        const Spacer(flex: 1),
        Container(  
          margin: CustomSharedConstants.boxInsets(20, 0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ])),
          child: MaterialButton(
            onPressed: () {},
            color: Colors.white,
            shape: null,
            child: Text("Deactivate", style: Theme.of(context).textTheme.bodyMedium,),
          ),
        ),
        ButtonWidget(
            onPressed: () {},
            textContent: "Sign Out",
            marginInsets: CustomSharedConstants.boxInsets(20, 20))
      ],
    );
  }
}

class ErrorMain extends MainScreenState {
  final String error;
  final AsyncSnapshot snapshot;
  ErrorMain(this.error, this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Text("Error: ${snapshot.error.toString()}",
        style: TextTheme.of(context).bodyMedium);
  }
}
