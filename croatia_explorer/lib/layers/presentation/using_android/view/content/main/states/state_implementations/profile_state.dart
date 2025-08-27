import 'package:croatia_explorer/layers/presentation/using_android/providers/profile_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/button.dart';
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
    AlertDialog dialog = AlertDialog(
      icon: const Icon(Icons.warning, color: Colors.redAccent),
      content: const Text("Are you sure you want to deactivate the account?"),
      backgroundColor: Colors.grey,
      actions: [
        MaterialButton(
          textColor: Colors.blue,
            onPressed: () async {
              AsyncData asyncContext = AsyncData(context);
              await ref.read(profileNotifier.notifier).signOutCurrentUser();
              await ref.read(profileNotifier.notifier).deactivateUser();
              Navigator.popUntil(asyncContext.value, (route) => route.isFirst);
            },
            child: const Text("Yes", style: TextStyle(fontWeight: FontWeight.w800))),
        MaterialButton(
          textColor: Colors.blueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No", style: TextStyle(fontWeight: FontWeight.w800)))
      ],
    );

    final profilerProvider = ref.watch(profileNotifier);
    final profile = profilerProvider.first;

    String extractedScreenName() {
      final namePart = profile.email!.split("@")[0];
      final names = namePart
          .split(".")
          .map((toElement) {
            toElement = toElement[0].toUpperCase() + toElement.substring(1);
            return toElement;
          })
          .toList()
          .join(" ");
      return names;
    }

    return Column(
      children: [
        Container(
            margin: CustomSharedConstants.boxInsets(20, 55),
            alignment: Alignment.centerLeft,
            child: Text("My Profile",
                style: Theme.of(context).textTheme.titleLarge)),
        Container(
            margin: CustomSharedConstants.boxInsets(20, 20),
            child: (profile.photoURL != null)
                ? CircleAvatar(
                    child: Image.network(
                    profile.photoURL!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ))
                : const Icon(Icons.person, size: 150)),
        Text(profile.displayName ?? extractedScreenName(),
            style: Theme.of(context).textTheme.titleMedium),
        Text(profile.email ?? "None",
            style: Theme.of(context).textTheme.labelMedium),
        const Spacer(flex: 1),
        Container(
          margin: CustomSharedConstants.boxInsets(20, 0),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ]),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            margin: const EdgeInsets.all(5.0),
            constraints: const BoxConstraints(maxHeight: 60),
            child: ElevatedButton(
              onPressed: () async {
                showDialog(context: context, builder: (context) => dialog);
              },
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  margin: CustomSharedConstants.boxInsets(0, 0),
                  constraints: const BoxConstraints(maxHeight: 60),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary
                    ]).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: Text(
                      "Deactivate",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ButtonWidget(
            onPressed: () async {
              await ref.read(profileNotifier.notifier).signOutCurrentUser();
            },
            textContent: "Sign Out",
            marginInsets: CustomSharedConstants.boxInsets(20, 20))
      ],
    );
  }
}
