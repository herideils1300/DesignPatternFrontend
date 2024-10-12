import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String label;
  // ignore: prefer_function_declarations_over_variables
  FormFieldValidator<String> validation = (String? value) => "";

  TextFormFieldWidget(this.validation,
      {super.key, controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: Theme.of(context).textTheme.displayMedium,
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.tertiary),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(20.0, 20.0))),
                constraints: BoxConstraints.loose(const Size(double.infinity, 60))),
            validator: validation,
          ),
        ],
      ),
    );
  }
}
