import 'package:croatia_explorer/layers/presentation/shared/gradients/gradient.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String textContent;
  final EdgeInsets marginInsets;

  const ButtonWidget(
      {super.key, required this.onPressed, required this.textContent, required this.marginInsets});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: marginInsets,
        decoration: BoxDecoration(
          gradient: linearGradient(Theme.of(context)),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))
        ),
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxHeight: 60),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: double.infinity,
            height: double.infinity,
            child: Text(textContent,
                style: Theme.of(context).textTheme.bodyMedium)));
  }
}
