import 'package:croatia_explorer/layers/presentation/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/appBar.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/textBox.dart';
import 'package:flutter/material.dart';

class RegisterScreenWidget extends StatefulWidget {
  const RegisterScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Sign up"),
      body: Center(
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
              TextFormFieldWidget((String? value) {
                return "";
              },
                  label: "Email",
                  marginInsets: GlobalSharedValues.boxInsets(32, 15)),
              TextFormFieldWidget((String? value) {
                return "";
              },
                  label: "Password",
                  marginInsets: GlobalSharedValues.boxInsets(15, 15)),
              TextFormFieldWidget((String? value) {
                return "";
              },
                  label: "Confirm password",
                  marginInsets: GlobalSharedValues.boxInsets(15, 0)),
              ButtonWidget(
                  textContent: "Sign up",
                  onPressed: () {Navigator.of(context).pushReplacementNamed("/verifyEmail");},
                  marginInsets: GlobalSharedValues.boxInsets(84, 30)),
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
                        onTap: () => Navigator.of(context).pop(),
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
