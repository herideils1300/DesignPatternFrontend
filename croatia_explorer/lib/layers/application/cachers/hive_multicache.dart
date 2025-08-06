import 'package:hive_ce/hive.dart';

class Multicache<E> {
  List<Box<E>> boxes = [];
  
  Multicache();

  void createOrOpen(String boxName) async {
    final newBox = await Hive.openBox<E>(boxName);
    boxes.add(newBox);
  }

  void save(String boxName, String key, E value) {
    Box<E> saveBox = boxes.singleWhere((box) => box.name == boxName);
    saveBox.put(key, value);
  }

  Iterable<E> extractAll(String boxName) {
    Box<E> saveBox = boxes.singleWhere((box) => box.name == boxName);
    return saveBox.values;
  }

  Future<E> extractByKey(String boxName, String key) async {
    Box<E> saveBox = boxes.singleWhere((box) => box.name == boxName);
    return saveBox.get(key)!;
  }

  void remove(String name, String? key) {
    Box<E> saveBox = boxes.singleWhere((box) => box.name == name);
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
