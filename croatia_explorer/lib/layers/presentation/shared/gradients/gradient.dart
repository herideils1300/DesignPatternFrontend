import 'package:flutter/material.dart';

LinearGradient linearGradient(ThemeData contextThemeData) =>
    LinearGradient(colors: [
      contextThemeData.colorScheme.primary,
      contextThemeData.colorScheme.secondary
    ], begin: Alignment.centerLeft, end: Alignment.centerRight);
