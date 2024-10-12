import 'package:croatia_explorer/layers/data/globalConstants/global.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/textBox.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/image.dart';
import 'package:flutter/material.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreenWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Form(
        key: _key,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageWidget("lib/assets/images/login_image.png",
                    height: 315, fit: BoxFit.fitHeight),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Please sign in to your account.",
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextFormFieldWidget(label: "Email", (String? value) {
                  RegExp regex = RegExp(GlobalConstants.emailPattern);
                  if (value!.isEmpty) {
                    return "Please enter an Email.";
                  }
                  if (!regex.hasMatch(value)) {
                    return "Please enter a valid email.";
                  }
                  return null;
                }),
                TextFormFieldWidget(label: "Password", (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter an Email.";
                  }
                  return null;
                }),
                Container(
                    margin: const EdgeInsets.only(right: 12, bottom: 23.5),
                    alignment: Alignment.centerRight,
                    child: Text("Forgot password?",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.displayMedium)),
                ButtonWidget(onPressed: () {}, textContent: "Sign in"),
                Text("Don’t have an account? Sign up!", style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
