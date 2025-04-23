import 'package:croatia_explorer/layers/presentation/using_android/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/widgets/button.dart';
import 'package:flutter/material.dart';

class ProfileStateWidget extends StatefulWidget {
  const ProfileStateWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfileStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("My Profile", style: Theme.of(context).textTheme.titleLarge),
        Container(margin: CustomSharedConstants.boxInsets(20, 20), child: Image.network("")),
        const Text("John Doe"),
        const Text("john.doe@example.com"),
        const Spacer(flex: 1),
        Container(
          margin: CustomSharedConstants.boxInsets(20, 0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ])),
          child: MaterialButton(
            onPressed: () {},
            color: Colors.white,
            shape: null,
            child: Text("Deactivate", style: Theme.of(context).textTheme.bodyMedium,),
          ),
        ),
        ButtonWidget(
            onPressed: () {},
            textContent: "Sign Out",
            marginInsets: CustomSharedConstants.boxInsets(20, 20))
      ],
    );
  }
}
