import 'package:croatia_explorer/layers/presentation/using_android/view/splashScreen.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ColorScheme generatedScheme = SeedColorScheme.fromSeeds(primaryKey: const Color.fromARGB(255, 157, 44, 86),
    secondaryKey: const Color.fromARGB(255, 209, 116, 56),
    tertiaryKey: const Color.fromARGB(255, 23, 28, 38),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreenWidget(),
        // '/login' : (context) => StatelessWidget(),
        // '/register' : (context) => StatelessWidget(),
        // '/home' : (context) => StatelessWidget(),
        // '/favourites' : (context) => StatelessWidget(),
        // '/profile' : (context) => StatelessWidget(),
        // '/verifyEmail' : (context) => StatelessWidget(),
        // '/sendPassword' : (context) => StatelessWidget()
              },
      theme: ThemeData.from(
        colorScheme: generatedScheme,
        // ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 157, 44, 86),
        // primary: const Color.fromARGB(255, 209, 116, 56),
        // secondary: const Color.fromARGB(255, 250, 253, 255),
        // onSecondary: const Color.fromARGB(255, 23, 28, 38),
        // onPrimary: const Color.fromARGB(255, 250, 253, 255),
        // background: const Color.fromARGB(255, 250, 253, 255),
        // ),

        textTheme: const TextTheme(titleLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 24))
      ),
    );
  }
}
