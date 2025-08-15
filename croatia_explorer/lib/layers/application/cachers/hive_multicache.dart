import 'dart:async';

import 'package:hive_flutter/adapters.dart';

class Multicache<E> {
  List<Box<E>> boxes = [];

  Multicache() {
    Hive.initFlutter();
  }

  bool _boxExists(String boxName) {
    return boxes.any((box) => box.name.toLowerCase() == boxName.toLowerCase());
  }

  void createOrOpen(String boxName) async {
    late Box<E> newBox;
    newBox = await Hive.openBox<E>(boxName);

    if (!_boxExists(boxName)) {
      boxes.add(newBox);
    }
  }

  void save(String boxName, String key, E value) {
    late Box<E> saveBox;
    
    if(_boxExists(boxName)){
       saveBox = boxes.firstWhere((box) => box.name.toLowerCase() == boxName.toLowerCase());
    }else{
      createOrOpen(boxName);
      saveBox = boxes.firstWhere((box) => box.name.toLowerCase() == boxName.toLowerCase());
    }

    saveBox.put(key, value);
  }

  List<E> extractAll(String boxName) {
    late Box<E> saveBox;

    if(_boxExists(boxName)) {
       saveBox = boxes.firstWhere((box) => box.name.toLowerCase() == boxName.toLowerCase());
    }else{
      createOrOpen(boxName);
      saveBox = boxes.firstWhere((box) => box.name.toLowerCase() == boxName.toLowerCase());
    }

    return (saveBox.values.isEmpty) ? saveBox.values.toList() : [];
  }

  FutureOr<E?> extractByKey(String boxName, String key) async {
    late Box<E> saveBox;

    if(_boxExists(boxName)){
       saveBox = boxes.firstWhere((box) => box.name.toLowerCase() == boxName.toLowerCase());
    }else{
      createOrOpen(boxName);
    }

    if (saveBox.isNotEmpty) {
      return saveBox.get(key)!;
    }
    return null;
  }

  void remove(String name, String? key) {
    Box<E> saveBox = boxes.singleWhere((box) => box.name.toLowerCase() == name.toLowerCase());

    if (key != null) {
      saveBox.delete(key);
    } else {
      saveBox.deleteFromDisk();
    }
  }

  void destroy() {
    for (int i = 0; i < boxes.length; i++) {
      boxes[i].deleteFromDisk();
    }
  }
}
