// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripphotosmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripphotosmodelAdapter extends TypeAdapter<Tripphotosmodel> {
  @override
  final int typeId = 4;

  @override
  Tripphotosmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tripphotosmodel(
      images: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Tripphotosmodel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripphotosmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
