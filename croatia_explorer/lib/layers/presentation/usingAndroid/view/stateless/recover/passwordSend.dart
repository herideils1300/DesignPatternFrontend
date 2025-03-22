import 'package:croatia_explorer/layers/presentation/usingAndroid/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/usingAndroid/view/shared/widgets/appBar.dart';
import 'package:croatia_explorer/layers/presentation/usingAndroid/view/shared/widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/usingAndroid/view/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class PasswordSentWidget extends StatefulWidget {
  const PasswordSentWidget({super.key});

  @override
  State<StatefulWidget> createState() => PasswordSentState();
}

class PasswordSentState extends State<PasswordSentWidget> {
  @override
  Widget build(BuildContext context) {
    SnackBar snackBar = SnackBarWidget.create(context, "Email resent.");

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
                      "Please check your inbox and reset your password.",
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
                      onTap: () => {ScaffoldMessenger.of(context).showSnackBar(snackBar)},
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
