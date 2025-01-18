// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyDatabaseAdapter extends TypeAdapter<MyDatabase> {
  @override
  final int typeId = 0;

  @override
  MyDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyDatabase(
      name: fields[0] as String,
      age: fields[1] as String,
      studentId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyDatabase obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.studentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
