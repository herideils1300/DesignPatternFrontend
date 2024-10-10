import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title) => AppBar(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  foregroundColor: Theme.of(context).colorScheme.onSecondary,
  title: Text(title, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
  centerTitle: true
  );