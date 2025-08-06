import 'package:croatia_explorer/layers/presentation/using_android/view/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileStateWidget extends ConsumerStatefulWidget {
  const ProfileStateWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends ConsumerState<ProfileStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: CustomSharedConstants.boxInsets(20, 20),
            child: CircleAvatar(child: Image.network(""))),
        Text("John Doe", style: Theme.of(context).textTheme.titleMedium),
        Text("john.doe@example.com",
            style: Theme.of(context).textTheme.labelMedium),
        const Spacer(flex: 1),
        Container(
          margin: CustomSharedConstants.boxInsets(20, 0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ]),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: MaterialButton(
            onPressed: () {},
            color: Colors.white,
            shape: null,
            child: ShaderMask(
              blendMode: BlendMode.screen,
              shaderCallback: (bounds) => LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Deactivate",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
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
