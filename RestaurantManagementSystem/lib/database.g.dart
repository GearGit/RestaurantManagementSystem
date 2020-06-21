// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheAdapter extends TypeAdapter<Cache> {
  @override
  final typeId = 0;

  @override
  Cache read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cache(
      idToken: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cache obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.idToken);
  }
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final typeId = 1;

  @override
  Item read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.quatity)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url);
  }
}
