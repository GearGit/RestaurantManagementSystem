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

class PurchaseItemAdapter extends TypeAdapter<PurchaseItem> {
  @override
  final typeId = 1;

  @override
  PurchaseItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseItem(
      quatity: fields[0] as int,
      price: fields[1] as int,
      name: fields[2] as String,
      url: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.quatity)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.url);
  }
}

class PurchaseListAdapter extends TypeAdapter<PurchaseList> {
  @override
  final typeId = 2;

  @override
  PurchaseList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseList(
      list: (fields[0] as List)?.cast<PurchaseItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }
}
