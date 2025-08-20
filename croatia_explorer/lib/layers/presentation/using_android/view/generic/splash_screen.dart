import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashScreenWidget extends ConsumerStatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  ConsumerState<SplashScreenWidget> createState() => SplashScreenState();


}

class SplashScreenState extends ConsumerState<SplashScreenWidget> {
  @override
  void initState() {
    NavigatorState nState = Navigator.of(context);
    Future.delayed(const Duration(seconds: 5)).then((_) {
      nState.pushReplacementNamed("/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(primary: true, automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageWidget("lib/assets/images/camping_image.png", fit: BoxFit.fitHeight),
            Container(
              width: 103,
              margin: const EdgeInsets.only(top: 20),
              child: Lottie.asset("lib/assets/animations/loading_dots.json",
                  alignment: Alignment.center),
            )
          ],
        ),
      ),
    );
  }
}
