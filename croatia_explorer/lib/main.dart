import 'package:croatia_explorer/layers/presentation/using_android/view/content/details/details_screen.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/screens/main_screen.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/login/login_screen.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/recover/password_resending_screen.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/signUp/register_screen.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/generic/splash_screen.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/recover/verify_email_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  FirebaseOptions options = const FirebaseOptions(
      apiKey: "AIzaSyDHasrfGg-jAoGhxhn3tZIr31rCL2_7cxE",
      appId: "1:33464896219:android:a0e53cb236775081149afe",
      messagingSenderId: "33464896219",
      projectId: "authentforflutterproj");
  await Firebase.initializeApp(options: options);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorScheme generatedScheme = SeedColorScheme.fromSeeds(
        primaryKey: const Color.fromARGB(255, 157, 44, 86),
        secondaryKey: const Color.fromARGB(255, 209, 116, 56),
        tertiaryKey: const Color.fromARGB(255, 23, 28, 38),
        brightness: Brightness.light);

    return MaterialApp(
      title: 'Flutter Project',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenWidget(),
        '/login': (context) => const LoginScreenWidget(),
        '/register': (context) => const RegisterScreenWidget(),
        '/home': (context) => const MainScreenWidget(),
        '/verifyEmail': (context) => const VerifyEmailScreenWidget(),
        '/resetPassword': (context) => const PasswordResendingScreenWidget(),
        '/details': (context) => const DetailsScreen()
        //'/sendPassword' : (context) =>
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

          textTheme: const TextTheme(
            titleSmall: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 24),
            titleMedium: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 32),
            titleLarge: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 40),
            displayMedium: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 18),
            bodyMedium: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromARGB(255, 250, 253, 255)),
            bodySmall: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            labelMedium: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            labelSmall: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          )),
    );
  }
}
