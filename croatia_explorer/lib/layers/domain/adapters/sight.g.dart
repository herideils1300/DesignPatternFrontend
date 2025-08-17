// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sight.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListSightAdapter extends TypeAdapter<ListSight> {
  @override
  final int typeId = 1;

  @override
  ListSight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListSight(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as double,
      fields[4] as int,
      fields[5] as String,
      fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ListSight obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lng)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.favourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListSightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
