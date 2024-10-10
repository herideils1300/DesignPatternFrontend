import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String label;
  // ignore: prefer_function_declarations_over_variables
  FormFieldValidator<String> validation = (String? value) => "";

  TextFormFieldWidget(this.validation, {super.key, controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.displayMedium,
          border:  OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              constraints: const BoxConstraints.expand(width: 380, height: 60)
              ),
      validator: validation,
    );
  }
}
