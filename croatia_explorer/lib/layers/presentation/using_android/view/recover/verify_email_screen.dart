import 'package:croatia_explorer/layers/domain/user.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/profile_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/app_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyEmailScreenWidget extends ConsumerStatefulWidget {
  const VerifyEmailScreenWidget({super.key});

  @override
  ConsumerState<VerifyEmailScreenWidget> createState() =>
      VerifyEmailScreenState();
}

class VerifyEmailScreenState extends ConsumerState<VerifyEmailScreenWidget> {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    SnackBar snackBar = SnackBarWidget.create(context, "Email resent.");
    SnackBar errorSnackBar = SnackBarWidget.create(context, "Something went wrong!");

    return Scaffold(
      appBar: appBar(context, "Verify email"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: CustomSharedConstants.boxInsets(206, 189),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: CustomSharedConstants.boxInsets(0, 30),
                        child: const ImageWidget(
                            "lib/assets/images/mail_sent.png",
                            fit: BoxFit.fitHeight,
                            height: 200)),
                    Text(
                      "Please check your inbox and verify your email address.",
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Text("Didn’t receive an email?",
                          style: Theme.of(context).textTheme.displayMedium)),
                  InkWell(
                      onTap: () async {
                        await ref.read(profileNotifier.notifier).sendConfirmationMail(user.email)
                        .onError((error, callStack) => errorSnackBar);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("Resend",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontFamily)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
