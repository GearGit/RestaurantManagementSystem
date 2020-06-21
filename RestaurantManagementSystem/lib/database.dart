import 'package:hive/hive.dart';
part 'database.g.dart';

@HiveType(typeId: 0)
class Cache extends HiveObject{
  @HiveField(0)
  String idToken;
  Cache({
    this.idToken
  });
}

@HiveType(typeId:1)
class Item extends HiveObject{
  @HiveField(0)
  int quatity;
  @HiveField(1)
  int price;
  @HiveField(2)
  String type;
  @HiveField(3)
  String description;
  @HiveField(4)
  String url;
  
  Item(
    this.quatity,
    this.price,
    this.type,
    this.description,
    this.url
  );
}


