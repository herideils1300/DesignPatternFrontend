import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsProvider extends StateNotifier<ModelSight>{
  DetailsProvider(super.state);

  void setLike(bool value){
    state.favourite = value;
  }
}