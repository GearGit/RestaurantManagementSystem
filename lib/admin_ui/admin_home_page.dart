import 'package:HOD_app/admin_ui/create_item.dart';
import 'package:HOD_app/admin_ui/item.dart';
import 'package:HOD_app/admin_ui/update_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminMain extends StatefulWidget {
  AdminMain({Key key}) : super(key: key);

  @override
  _AdminMainState createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    final _controller = TabController(length: 2, vsync: this);

    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateItemPage()));
        },
        child: Icon(Icons.add,color: Colors.white,), 
        backgroundColor: Colors.red[900],
        ),
      

      appBar: AppBar(
        title:Text("Admin Panel", style:TextStyle(fontSize:28.0,fontWeight:FontWeight.bold,color:Colors.black),),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              dialog();
            }, 
            child: Text("LogOut")
            ),
          FlatButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed("/homePage");
            }, 
            child: Text("User")
            ),
        ],
        backgroundColor: Colors.white,
        centerTitle:true,
        bottom:TabBar(
          controller: _controller,
          indicatorColor:Colors.red[900],
          unselectedLabelColor: Colors.grey,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,left:30.0,bottom: 10.0),
                child: Text("AVAILABLE ITEMS",style:TextStyle(color:Colors.black))
                ),
              ),
            Tab(
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,left:30.0,bottom: 10.0),
                child: Text("ORDERS",style:TextStyle(color:Colors.black)),
                ),
              ),
          ],
        )
      ),

      body: 
          TabBarView(
            controller:_controller,
            children: <Widget>[
              StreamBuilder(
                stream: Firestore.instance.collection("food_menu").document("item").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            DocumentSnapshot items = snapshot.data;
            List<dynamic> allItems = items.data["item"];
          if(allItems != null){

            List listItems = [];
            allItems.forEach((element) {
              listItems.add(Item.fromSnapshot(element));
            });

            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return buildListItems(listItems[index]);
                },

              );
          
            }
          }else{
            return Center(
              child: Container(
                child:Text("No Items to show")
              ),
            );
          }
          }
      ),
              StreamBuilder(
                stream: Firestore.instance.collection("order").document("order").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            DocumentSnapshot items = snapshot.data;
            List<dynamic> allItems = items.data["order"];
          if(allItems != null){

            List listItems = [];
            allItems.forEach((element) {
              listItems.add(OrderItem.fromSnapshot(element));
            });

            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return buildOrderList(listItems[index]);
                },

              );
          
            }else{
            return Center(
              child: Container(
                child:Text("No Orders")
              ),
            );
          }
          }
          }
      ),
              
            ],
          
          ),
    );
  }
  
  void dialog(){
    AlertDialog alert = new AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to log out?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).popAndPushNamed('/RootPage');
          }, 
          child: Text("Yes")
          ),
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text("No")
          ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildListItems(data){

    String name = data.name;
    int qty = data.qty;
    int price = data.price;

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.only(left:20.0,right:20.0,top:10.0,bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.all(Radius.circular(12.0)),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$name".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
        ),
        subtitle: Column(
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total Qantity\t:\t$qty"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Item Price\t:\t$price"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    onPressed: (){
                      _showDeleteDialog(context,data);
                    },
                    color: Colors.red,
                    child: Text("Delete",style:TextStyle(color: Colors.white)),
                  ),
              )
        ]),
        ),
    );
  }

  Widget buildOrderList(data){
    String name = data.name;
    int qty = data.qty;
    int price = data.price * qty;

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.only(left:20.0,right:20.0,top:10.0,bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.all(Radius.circular(12.0)),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$name",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
        ),
        subtitle: Column(
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total Qantity\t:\t$qty"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total Price\t:\t$price"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  
                  RaisedButton(
                    onPressed: () async{
                      await removeOrder(data);
                    },
                    color: Colors.blue,
                    child: Text("Order Completed",style:TextStyle(color: Colors.white)),
                  ),
                  
                  RaisedButton(
                    onPressed: (){
                      _showCancelDialog(context,data);
                    },
                    color: Colors.red,
                    child: Text("Cancel Order",style:TextStyle(color: Colors.white)),
                  ),

                ],),
              )
        ]),
        ),
    );
  }

  Future removeOrder(map) async{
    DocumentReference docRef = Firestore.instance.collection("order").document("order");
      docRef.updateData(
      {
        "order" : FieldValue.arrayRemove([{
          "name":map.name,
          "qty":map.qty,
          "price":map.price,
        }])
      });
  }
  
  Future removeItem(data) async{
    DocumentReference docRef = Firestore.instance.collection("food_menu").document("item");
      docRef.updateData(
      {
        "item" : FieldValue.arrayRemove([{
            "name" : data.name.toString(),
            "category" : data.category.toString(),
            "isVeg" : data.isVeg,
            "url" : data.url.toString(),
            "price" : data.price,
            "qty" : data.qty,
          }])
      });
  }
  
  void _showDeleteDialog(BuildContext context,map){
    AlertDialog alert = AlertDialog(
      title: Text("Delete Item"),
      content: Text("Are you sure you want to delete this item ?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () async{
            Navigator.of(context).pop();
            await removeItem(map);
          },  
          child: Text("Yes")
          ),
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text("No")
          ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void _showCancelDialog(BuildContext context,dynamic data){
    AlertDialog alert = AlertDialog(
      title: Text("Cancel Order"),
      content: Text("Are you sure you want to cancel the order?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () async{
            Navigator.of(context).pop();
            await removeOrder(data);
          }, 
          child: Text("Yes")
          ),
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text("No")
          ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
