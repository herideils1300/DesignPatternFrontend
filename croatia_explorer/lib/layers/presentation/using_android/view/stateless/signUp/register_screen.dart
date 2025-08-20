import 'package:croatia_explorer/layers/application/constants/global.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/app_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/text_box.dart';
import 'package:flutter/material.dart';

class RegisterScreenWidget extends StatefulWidget {
  const RegisterScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreenWidget> {
  final _key = GlobalKey<FormState>();
  final _repeatPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Sign up"),
      body: Form(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 39),
                  child: const ImageWidget("lib/assets/images/login_image.png",
                      height: 135.76, fit: BoxFit.fitHeight),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 39.24),
                  child: Text("Please create an account to continue.",
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextFormFieldWidget(
                    validation: (String? value) {
                      RegExp regex = RegExp(GlobalConstants.emailPattern);
                      if (value!.isEmpty) {
                        return "Please enter an Email.";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Please enter a valid email.";
                      }

                      return "";
                    },
                    label: "Email",
                    marginInsets: CustomSharedConstants.boxInsets(32, 15)),
                TextFormFieldWidget(
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a password.";
                      }

                      return "";
                    },
                    label: "Password",
                    marginInsets: CustomSharedConstants.boxInsets(15, 15)),
                TextFormFieldWidget(
                    controller: _repeatPasswordController,
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter the repeated password.";
                      }
                      if (_repeatPasswordController.text != value) {
                        return "The passwords do not match";
                      }
                      return "";
                    },
                    label: "Confirm password",
                    marginInsets: CustomSharedConstants.boxInsets(15, 0)),
                ButtonWidget(
                    textContent: "Sign up",
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();
                        Navigator.of(context).pushNamed("/verifyEmail");
                      }
                    },
                    marginInsets: CustomSharedConstants.boxInsets(84, 30)),
                Container(
                  margin: const EdgeInsets.only(bottom: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: Theme.of(context).textTheme.displayMedium),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: InkWell(
                          onTap: () {},
                          child: Text("Sign in",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontFamily,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
