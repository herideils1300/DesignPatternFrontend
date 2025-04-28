import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

sealed class MainScreenState {}

class LoadingMain extends MainScreenState {}

class LoadedSightsMain extends MainScreenState{
  final List<ListSight> sights;
  LoadedSightsMain(this.sights);
}

class LoadedFavouritesMain extends MainScreenState{
    final List<ListSight> sights;
    LoadedFavouritesMain(this.sights);
}

class LoadedProfileMain extends MainScreenState {
  //TODO: Add firebase constructor
}

class ErrorMain extends MainScreenState{
  final String error;
  ErrorMain(this.error);
}