import 'package:croatia_explorer/layers/domain/user.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/profile_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/app_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/snack_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResendingScreenWidget extends ConsumerStatefulWidget {
  const PasswordResendingScreenWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      PasswordResendingScreenState();
}

class PasswordResendingScreenState
    extends ConsumerState<ConsumerStatefulWidget> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    User user = User("", "");

    SnackBar snackbar =
        SnackBarWidget.create(context, "Verification email sent.");

    SnackBar errorSnackbar =
        SnackBarWidget.create(context, "Something went wrong!");

    return Scaffold(
      appBar: appBar(context, "Reset password"),
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: const ImageWidget(
              "lib/assets/images/reset_password_email.png",
              fit: BoxFit.fitHeight,
              height: 200,
            )),
            Container(
              child: Text(
                textAlign: TextAlign.center,
                "Please enter your email address to reset your password.",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            TextFormFieldWidget(
              validation: (String? value) {
                if (value!.isEmpty) {
                  return "The field cannot stay empty.";
                }

                return null;
              },
              label: "Email",
              marginInsets: CustomSharedConstants.boxInsets(56, 30),
              onSaved: (String? newValue) {
                user.email = newValue!;
              },
            ),
            ButtonWidget(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    AsyncData<BuildContext> asyncContext = AsyncData(context);
                    _key.currentState!.save();
                    ref
                        .read(profileNotifier.notifier)
                        .sendRecoveryMail(user.email)
                        .onError((handleError, stackTrace) =>
                            ScaffoldMessenger.of(asyncContext.value)
                                .showSnackBar(errorSnackbar))
                        .then((_) => ScaffoldMessenger.of(asyncContext.value)
                            .showSnackBar(snackbar));
                  }
                },
                textContent: "Reset password",
                marginInsets: CustomSharedConstants.boxInsets(0, 0)),
          ],
        ),
      ),
    );
  }
}
