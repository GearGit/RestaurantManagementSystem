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