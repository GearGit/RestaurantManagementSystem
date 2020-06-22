class Item{

  String name;
  String category;
  String url;
  int qty;
  int price;
  bool isVeg;

  Item({
    this.name,
    this.category,
    this.url,
    this.price,
    this.qty,
    this.isVeg,
  });

  String get getName => name;
  String get getUrl => url;
  String get getCategory => category;
  int get getPrice => price;
  int get getQty => qty;
  bool get getIsveg => isVeg;

  Item.fromSnapshot(Map<String,dynamic> snapshot){

    name = snapshot["name"];
    category = snapshot["category"];
    url = snapshot["url"];
    price = snapshot["price"];
    qty = snapshot["qty"];
    isVeg = snapshot["isVeg"];

  }
}

class OrderItem{

  String name;
  int qty;
  int price;

  OrderItem({
    this.name,
    this.price,
    this.qty,
  });

  String get getName => name;
  int get getPrice => price;
  int get getQty => qty;

  OrderItem.fromSnapshot(Map<String,dynamic> snapshot){

    name = snapshot["name"];
    price = snapshot["price"];
    qty = snapshot["qty"];

  }
}