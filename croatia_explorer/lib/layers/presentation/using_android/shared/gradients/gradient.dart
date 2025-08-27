import 'package:flutter/material.dart';

LinearGradient linearGradient(ThemeData contextThemeData) => LinearGradient(
        colors: [
          contextThemeData.colorScheme.secondary,
          contextThemeData.colorScheme.primary
        ],
        stops: const [
          0,
          1
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.clamp);
