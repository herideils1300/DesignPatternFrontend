import 'dart:async';

import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:hive_flutter/adapters.dart';

class Cacher<E> {
  late Box<E> box;

  Cacher() {
    Hive.initFlutter();
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ListSightAdapter());
    }
  }

  Future<void> createOrOpen(String boxName) async {
    box = await Hive.openBox(boxName);
  }

  void save(String key, E value) {
    box.put(key, value);
  }

  List<E> extractAll(String boxName) {
    return box.values.toList(growable: true);
  }

  FutureOr<E?> extractByKey(String key) async {
    return (box.keys.any((innerKey) => key == innerKey)) ? box.get(key) : null;
  }

  void remove(String key) {
    box.delete(key);
  }

  void destroy() {
    box.deleteFromDisk();
  }
}
