// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritemodelAdapter extends TypeAdapter<Favoritemodel> {
  @override
  final int typeId = 5;

  @override
  Favoritemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favoritemodel(
      id: fields[0] as int?,
      place: fields[1] as String,
      startdate: fields[2] as String,
      enddate: fields[3] as String,
      expectedamount: fields[4] as String,
      number: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Favoritemodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.place)
      ..writeByte(2)
      ..write(obj.startdate)
      ..writeByte(3)
      ..write(obj.enddate)
      ..writeByte(4)
      ..write(obj.expectedamount)
      ..writeByte(5)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
