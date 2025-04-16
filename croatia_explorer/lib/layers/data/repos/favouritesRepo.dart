import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:hive_ce/hive.dart';

class FavouritesRepo {
  final String boxName = "sightsBox";
  late final Box<ListSight> box;

  Future<int> _openBox() async {
    box = await Hive.openBox(boxName);
    return box.values.toList().length;
  }

  void _closeBox() {
    Hive.close();
  }

  FavouritesRepo(String path) {
    Hive.init(path);
    _openBox();
  }

  Future<Iterable<ListSight>> getAllFavourites() async {
    await _openBox();
    List<ListSight> sights = box.values.toList();
    _closeBox();

    return sights;
  }

  void addFavourite(ListSight sight) async {
    await _openBox();
    box.add(sight);
    _closeBox();
  }
}
