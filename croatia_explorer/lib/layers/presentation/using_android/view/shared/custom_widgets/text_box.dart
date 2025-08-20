import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String label;
  final EdgeInsets marginInsets;
  // ignore: prefer_function_declarations_over_variables
  FormFieldValidator<String> validation = (String? value) => "";
  void Function(String? newValue)? onSaved = (newValue) => "";

  TextFormFieldWidget(
      {super.key,
      controller,
      required this.label,
      required this.marginInsets,
      required this.validation,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginInsets,
      child: Column(
        children: [
          TextFormField(
            onSaved: onSaved,
            controller: controller,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: Theme.of(context).textTheme.displayMedium,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                constraints:
                    BoxConstraints.loose(const Size(double.infinity, 80))),
            validator: validation,
          ),
        ],
      ),
    );
  }
}
