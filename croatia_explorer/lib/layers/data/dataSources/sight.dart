import 'package:dio/dio.dart';

BaseOptions sightBaseOptions = BaseOptions(
  baseUrl: "http://144.91.87.48:8080",
  connectTimeout: const Duration(minutes: 5)
  //TODO: Add headers and other stuff if necessary.
);