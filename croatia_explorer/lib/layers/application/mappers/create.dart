import 'package:croatia_explorer/layers/data/dto/SightDto.dart';
import 'package:croatia_explorer/layers/data/dto/UserDto.dart';
import 'package:croatia_explorer/layers/domain/Sight.dart';
import 'package:croatia_explorer/layers/domain/User.dart';
import 'package:dart_class_mapper/dart_class_mapper.dart';

void createMappers() {
  CreateMap<User, UserDto>((userDto) {
    return User(userDto.email, userDto.name, userDto.image);
  });

  CreateMap<ListSight, SightDto>((value) => ListSight(value.title, value.adress,
      value.lat, value.lng, value.rating, value.imageUrl));
}
