// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glocery_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GloseryModelAdapter extends TypeAdapter<GloseryModel> {
  
  @override
  final int typeId = 0;

  @override
  GloseryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GloseryModel(
      quantity: fields[1] as String,
      date: fields[2] as String,
      completd: fields[3] as bool,
      item: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GloseryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.completd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GloseryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
