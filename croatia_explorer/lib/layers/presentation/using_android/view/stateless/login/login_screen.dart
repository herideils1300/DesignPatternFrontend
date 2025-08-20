import 'package:croatia_explorer/layers/application/constants/global.dart';
import 'package:croatia_explorer/layers/domain/credentials.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/text_box.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/image.dart';
import 'package:flutter/material.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreenWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  StoredCredentials creds = StoredCredentials();

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
                    marginInsets: CustomSharedConstants.boxInsets(24, 12),
                    onSaved: (String? newValue) {
                      creds.email = newValue!;
                    }, validation: (String? value) {
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
                  onSaved: (newValue){
                    creds.password = newValue!;
                  },
                    label: "Password",
                    marginInsets: CustomSharedConstants.boxInsets(12, 13),
                    validation: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter an Email.";
                  }
                  return null;
                }),
                Container(
                    margin: const EdgeInsets.only(right: 12, bottom: 23.5),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed("/resetPassword"),
                      child: Text("Forgot password?",
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.displayMedium),
                    )),
                ButtonWidget(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      Navigator.of(context).pushNamed("/home");
                    }
                  },
                  textContent: "Sign in",
                  marginInsets: CustomSharedConstants.boxInsets(23.5, 0),
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
                          onTap: () =>
                              Navigator.of(context).pushNamed("/register"),
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
