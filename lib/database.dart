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
class PurchaseItem extends HiveObject{
  @HiveField(0)
  int quatity;
  @HiveField(1)
  int price;
  @HiveField(2)
  String name;
  @HiveField(3)
  String url;
  
  PurchaseItem({
    this.quatity,
    this.price,
    this.name,
    this.url
  });
}

@HiveType(typeId:2)
class PurchaseList extends HiveObject{
  @HiveField(0)
  List<PurchaseItem> list;

  PurchaseList({this.list});

}


