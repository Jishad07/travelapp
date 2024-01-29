// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expensemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensemodelAdapter extends TypeAdapter<Expensemodel> {
  @override
  final int typeId = 3;

  @override
  Expensemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expensemodel(
      id: fields[0] as int?,
      date: fields[1] as String,
      time: fields[2] as String,
      category: fields[3] as String,
      amount: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Expensemodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
