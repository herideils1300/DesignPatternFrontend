// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../_sight.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelSightAdapter extends TypeAdapter<ModelSight> {
  @override
  final int typeId = 1;

  @override
  ModelSight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelSight(
      fields[0] as String,
      fields[2] as String,
      fields[1] as String,
      fields[3] as double,
      fields[4] as double,
      fields[5] as int,
      fields[6] as String,
      fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ModelSight obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.lng)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.favourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelSightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
