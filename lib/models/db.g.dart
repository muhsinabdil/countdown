// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBAdapter extends TypeAdapter<DB> {
  @override
  final int typeId = 0;

  @override
  DB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DB(
      title: fields[0] as String?,
      date: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
