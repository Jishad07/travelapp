// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginmodelAdapter extends TypeAdapter<Loginmodel> {
  @override
  final int typeId = 1;

  @override
  Loginmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Loginmodel(
      id: fields[0] as int?,
      image: fields[1] as String,
      username: fields[2] as String,
      password: fields[3] as String,
      email: fields[4] as String,
      phonenumber: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Loginmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phonenumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
