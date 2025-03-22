import 'package:flutter/material.dart';


class CustomCardState<T> extends StatelessWidget {

  final T data;

  const CustomCardState({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(vertical: 20),
    child: Card(child: Row(children: [
      Image.network(this.data as String),
      
    ])));
  }

}