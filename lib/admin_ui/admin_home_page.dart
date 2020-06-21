import 'package:HOD_app/admin_ui/create_item.dart';
import 'package:HOD_app/admin_ui/update_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

      body: StreamBuilder(
        stream: Firestore.instance.collection("menu").document("main").snapshots(),
        builder: (context, snapshot) {
          var items = snapshot.data;
          print(items.toString());
          return TabBarView(
            controller:_controller,
            children: <Widget>[
              
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildListItems();
                },

              ),
              
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                // separatorBuilder: (context, index) {
                //   return SizedBox(height:5.0);
                // },
                itemBuilder: (context, index) {
                  return buildListItems();
                },
              ),
            ],
          
          );
        }
        
      ),

    );
  }

  Widget buildListItems(){

    String name = "Butter Chicken";
    int qty = 15;
    int price = 150;

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
                child: Text("Item Price\t:\t$price"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => UpdateItemPage()));
                    },
                    color: Colors.blue,
                    child: Text("Update",style:TextStyle(color: Colors.white)),
                  ),
                  
                  RaisedButton(
                    onPressed: (){
                      _showDeleteDialog(context);
                    },
                    color: Colors.red,
                    child: Text("Delete",style:TextStyle(color: Colors.white)),
                  ),

                ],),
              )
        ]),
        ),
    );
  }

  Widget buildOrderList(){
    String name = "Butter Chicken";
    int qty = 15;

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => UpdateItemPage()));
                    },
                    color: Colors.blue,
                    child: Text("Order Completed",style:TextStyle(color: Colors.white)),
                  ),
                  
                  RaisedButton(
                    onPressed: (){
                      _showCancelDialog(context);
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

  void _showDeleteDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      title: Text("Delete Item"),
      content: Text("Are you sure you want to delete this item ?"),
      actions: <Widget>[
        FlatButton(
          onPressed: (){}, 
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

  void _showCancelDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      title: Text("Cancel Order"),
      content: Text("Are you sure you want to cancel the order?"),
      actions: <Widget>[
        FlatButton(
          onPressed: (){}, 
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