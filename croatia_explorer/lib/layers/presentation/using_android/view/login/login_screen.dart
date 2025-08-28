import 'package:croatia_explorer/layers/application/constants/global.dart';
import 'package:croatia_explorer/layers/domain/credentials.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/profile_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/text_box.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreenWidget extends ConsumerStatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  ConsumerState<LoginScreenWidget> createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreenWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final StoredCredentials creds = StoredCredentials();

  @override
  Widget build(BuildContext context) {
    final profileProvider = ref.watch(profileNotifier.notifier);

    Column formColumn = Column(
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
            },
            validation: (String? value) {
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
            onSaved: (newValue) {
              creds.password = newValue!;
            },
            obscure: true,
            label: "Password",
            marginInsets: CustomSharedConstants.boxInsets(12, 13),
            validation: (String? value) {
              if (value!.isEmpty) {
                return "Please enter a password.";
              }

              return null;
            }),
        Container(
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed("/resetPassword"),
              child: Text("Forgot password?",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.displayMedium),
            )),
        const Spacer(),
        ButtonWidget(
          onPressed: () async {
            // if (_key.currentState!.validate()) {
            //   _key.currentState!.save();
            //   profileProvider.store(creds);
              AsyncData contextAsync = AsyncData<BuildContext>(context);
            //   try {
            //     await profileProvider.signInUser();
            //     if (contextAsync.hasValue && !contextAsync.isLoading) {
                  Navigator.pushNamed(contextAsync.value, "/home");
            //     }
            //   } catch (e) {
            //     _key.currentState!.reset();
                
            //   }
            // }
          },
          textContent: "Sign in",
          marginInsets: CustomSharedConstants.boxInsets(23.5, 0),
        ),
        Container(
          margin: CustomSharedConstants.boxInsets(0, 30),
          child: Center(
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
        ),
      ],
    );

    void addError() {
      formColumn.children.insert(
          6,
          const Center(
              child: Text("Email or password are incorrect.",
                  style:
                      TextStyle(color: Colors.redAccent, fontSize: 18))));
    }

    return Scaffold(
      body: Form(key: _key, child: formColumn),
    );
  }
}
