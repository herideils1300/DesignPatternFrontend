import 'package:croatia_explorer/layers/data/dto/sight_dto.dart';
import 'package:croatia_explorer/layers/data/dto/user_dto.dart';
import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/domain/user.dart';
import 'package:dart_class_mapper/dart_class_mapper.dart';

void createMappers() {
  CreateMap<User, UserDto>((userDto) {
    return User(userDto.email, userDto.name, userDto.image);
  });

  CreateMap<ListSight, SightDto>((value) => ListSight(value.title, value.adress,
      value.lat, value.lng, value.rating, value.imageUrl));

  CreateMap<, SightDto>
}
