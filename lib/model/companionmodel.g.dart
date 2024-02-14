// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companionmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanionModelAdapter extends TypeAdapter<CompanionModel> {
  @override
  final int typeId = 6;

  @override
  CompanionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanionModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      phonenumber: fields[2] as String,
      tripid: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CompanionModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phonenumber)
      ..writeByte(3)
      ..write(obj.tripid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
