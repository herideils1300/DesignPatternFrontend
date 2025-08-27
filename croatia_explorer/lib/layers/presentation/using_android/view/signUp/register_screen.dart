import 'dart:async';

import 'package:croatia_explorer/layers/application/constants/global.dart';
import 'package:croatia_explorer/layers/domain/user.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/profile_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/app_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreenWidget extends ConsumerStatefulWidget {
  const RegisterScreenWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends ConsumerState<RegisterScreenWidget> {
  final _key = GlobalKey<FormState>();
  User user = User("", "");

  bool setError = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _repeatPasswordController =
        TextEditingController.fromValue(TextEditingValue.empty);
    
    Text errorText = const Text("Something went wrong with the registration process.", style: TextStyle(color: Colors.redAccent));



    return Scaffold(
      appBar: appBar(context, "Sign up"),
      body: Form(
        key: _key,
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
                  onSaved: (newValue) => user.email = newValue!,
                  validation: (String? value) {
                    RegExp regex = RegExp(GlobalConstants.emailPattern);
                    if (value!.isEmpty) {
                      return "Please enter an Email.";
                    }
                    if (!regex.hasMatch(value)) {
                      return "Please enter a valid email.";
                    }
                    return null;
                  },
                  label: "Email",
                  marginInsets: CustomSharedConstants.boxInsets(32, 15)),
              TextFormFieldWidget(
                  controller: _repeatPasswordController,
                  onSaved: (newValue) {
                    user.password = newValue!;
                    setState(() {
                      _repeatPasswordController.text = newValue;
                    });
                  },
                  validation: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter a password.";
                    }

                    return null;
                  },
                  label: "Password",
                  marginInsets: CustomSharedConstants.boxInsets(15, 15)),
              TextFormFieldWidget(
                  onSaved: (newValue) => user.password = newValue!,
                  validation: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter the repeated password.";
                    }
                    if (_repeatPasswordController.text != value) {
                      return "The passwords do not match";
                    }

                    return null;
                  },
                  label: "Confirm password",
                  marginInsets: CustomSharedConstants.boxInsets(15, 0)),
                  if (setError) Container(margin: CustomSharedConstants.boxInsets(10.0, 0), child: errorText,),
              ButtonWidget(
                  textContent: "Sign up",
                  onPressed: () {
                    _key.currentState!.save();
                    if (_key.currentState!.validate()) {
                      setError = false;
                      AsyncData contextAsync = AsyncData<BuildContext>(context);
                      ref
                          .read(profileNotifier.notifier)
                          .addUser(user)
                          .onError((error, stackTrace){
                            setState(() {
                              setError = true;
                            });
                            return error.toString();
                          })
                          .then((value) async => await ref
                              .read(profileNotifier.notifier)
                              .sendConfirmationMail(value))
                          .whenComplete((){
                        if (contextAsync.hasValue && !setError) {
                          Navigator.of(contextAsync.value)
                              .pushNamed("/verifyEmail", arguments: user);
                        }
                      });
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
                        onTap: () {
                          Navigator.of(context).pop();
                        },
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
    );
  }
}
