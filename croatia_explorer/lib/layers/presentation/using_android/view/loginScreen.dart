import 'package:croatia_explorer/layers/data/globalConstants/global.dart';
import 'package:croatia_explorer/layers/presentation/shared/constants/values.dart';
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
                TextFormFieldWidget(
                    label: "Email",
                    marginInsets: GlobalSharedValues.boxInsets(24, 12),
                    (String? value) {
                  RegExp regex = RegExp(GlobalConstants.emailPattern);
                  if (value!.isEmpty) {
                    return "Please enter an Email.";
                  }
                  if (!regex.hasMatch(value)) {
                    return "Please enter a valid email.";
                  }
                  return null;
                }),
                TextFormFieldWidget(
                    label: "Password",
                    marginInsets: GlobalSharedValues.boxInsets(12, 13),
                    (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter an Email.";
                  }
                  return null;
                }),
                Container(
                    margin: const EdgeInsets.only(right: 12, bottom: 23.5),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed("/resetPassword"),
                      child: Text("Forgot password?",
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.displayMedium),
                    )),
                ButtonWidget(
                  onPressed: () {},
                  textContent: "Sign in",
                  marginInsets: GlobalSharedValues.boxInsets(23.5, 23.5),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                          style: Theme.of(context).textTheme.displayMedium),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pushNamed("/register"),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .fontFamily,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
