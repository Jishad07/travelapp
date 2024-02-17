// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iterymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IteryModelAdapter extends TypeAdapter<IteryModel> {
  @override
  final int typeId = 7;

  @override
  IteryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IteryModel(
      id: fields[0] as int?,
      itery: fields[1] as String,
      tripid: fields[2] as int,
      day: fields[3] as int,
      time: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, IteryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itery)
      ..writeByte(2)
      ..write(obj.tripid)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IteryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
