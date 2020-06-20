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
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null, 
        label: Text("Add Item",style: TextStyle(color:Colors.white),),
        icon: Icon(Icons.add,color: Colors.white,),
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
              text: "ORDERS",
              // child: Padding(
              //   padding: const EdgeInsets.only(top:10.0,left:30.0,bottom: 10.0),
              //   child: Text("ORDERS",style:TextStyle(color:Colors.black)),
              //   ),
              ),
          ],
        )
      ),

      body: TabBarView(
        controller:_controller,
        children: <Widget>[
          Center(
            child:Container(child: Text("TAB BAR VIEW"),)
          ),
          Center(
            child:Container(child: Text("TAB BAR VIEW"),)
          ),
      ],),

    );
  }

  Widget buildListItems(){
    String name = "Butter Chicken";
    int qty = 15;
    int price = 150;
    int queue = 5;
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.all(Radius.circular(12.0)),
      ),
      child: ListTile(
        title: Text("$name",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.w400)),
        subtitle: Column(
          children: <Widget>[
              Text("Total Qantity\t:\t$qty"),
              Text("Item Price\t:\t$price"),
              Text("Orders in Queue\t:\t$queue"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                
                RaisedButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text("Update",style:TextStyle(color: Colors.white)),
                ),
                
                RaisedButton(
                  onPressed: (){},
                  color: Colors.red,
                  child: Text("Delete",style:TextStyle(color: Colors.white)),
                ),

              ],)
        ]),
        ),
    );
  }

  void _showDialog(BuildContext context){
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

}