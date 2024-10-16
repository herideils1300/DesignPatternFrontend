import 'package:croatia_explorer/layers/presentation/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/appBar.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/image.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/snackbar.dart';
import 'package:croatia_explorer/layers/presentation/shared/widgets/textBox.dart';
import 'package:flutter/material.dart';

class PasswordResendingScreenWidget extends StatefulWidget {
  const PasswordResendingScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() => PasswordResendingScreenState();
}

class PasswordResendingScreenState
    extends State<PasswordResendingScreenWidget> {
  @override
  Widget build(BuildContext context) {
    SnackBar snackbar = SnackBarWidget.create(context, "Verification email sent.");

    return Scaffold(
      appBar: appBar(context, "Reset password"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: const ImageWidget("lib/assets/images/reset_password_email.png")),
          Container(
            child: Text(
              textAlign: TextAlign.center,
              "Please enter your email address to reset your password.",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          TextFormFieldWidget((String? value) {
            return "";
          },
              label: "Email",
              marginInsets: GlobalSharedValues.boxInsets(56, 30)),
          ButtonWidget(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(snackbar);}, textContent: "Reset password", marginInsets: GlobalSharedValues.boxInsets(0, 0)),
        ],
      ),
    );
  }
}
