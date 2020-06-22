import 'package:HOD_app/payment.dart';
import 'package:HOD_app/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InvoicePage extends StatefulWidget {
  InvoicePage({Key key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {

  Future list;
  List itemList;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  Future getData() async{
    Box box = await Hive.openBox(databasePurchaseList);
    print("Box keys :\n"+box.keys.toString());
    return box;
  }

  @override
  void initState() {
    // TODO: implement initState
    list = getData();
    itemList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: _scaffoldkey,     
          floatingActionButton: FloatingActionButton.extended(
            heroTag: "Checkout",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ), 
            ),
            label: Row(
              children: <Widget>[
                Icon(Icons.check,color:Colors.white),
                Text("Pay",style: TextStyle(color:Colors.white,fontWeight:FontWeight.w400,fontStyle:FontStyle.italic),),
              ],
            ),
            // icon:Icon(Icons.check),
            // label:Text("Checkout",style: TextStyle(color:Colors.white,fontWeight:FontWeight.w400,fontStyle:FontStyle.italic),),
            backgroundColor: Color(0xff1B3F8B),
            onPressed: (){
              itemList.length > 0 
              ? 
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentClass(data : itemList),))
                
              : _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("Cart is empty",textAlign: TextAlign.center,),));
            }
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          
          body:
           NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              expandedHeight: 100.0,
              pinned:false,
              backgroundColor: Colors.white,
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                  Navigator.of(context).popAndPushNamed("/admin");
                  }, child: Text("Admin")),
                FlatButton(
                  onPressed: (){
                    
                  addItem(itemList);
                  Navigator.of(context).popAndPushNamed("/admin");
                  }, child: Text("Add")),
              ],
              title: Container(
                height: 50,
                margin: EdgeInsets.only(top:60.0,bottom:20,left: 10.0),
                child: Text("INVOICE",style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300,color: Colors.black),)),
              // centerTitle: true,
            )
          ];
        },
        body: FutureBuilder(
          future: list,
          builder: (context, snapshot) {
            
            if(snapshot.hasData && snapshot.data.get(0)!=null){
              // print("snapshot.data \n");
              // print(snapshot.data.get(0).toString());
                itemList = snapshot.data.get(0);
                // print(itemList.toString());
                // print(itemList.length);
              return Container(
              width: MediaQuery.of(context).size.width*0.8,
              margin: EdgeInsets.only(bottom:60.0),
              child: itemList.length == 0 ?
               Center(
                child: Container(
                  child: Text("No item added in cart"),
                ),
              ) :
               ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height:10.0);
                },
                shrinkWrap: true,
                itemCount: itemList.length,
                itemBuilder: (context,index){
                  return buildPurchaseItem(itemList[index],index);
                }),
            );
            }else{
              return Center(
                child: Container(
                  child: Text("No item added in cart"),
                ),
              );
            }
          },
                
        )
      ),
    );
  }
  void addItem(List<dynamic> list) async{
    DocumentReference docRef = Firestore.instance.collection("order").document("order");
    List<dynamic> l = [];
    list.forEach((element) {
      l.add({
        "name":element.name,
        "qty":element.quatity,
        "price":element.price,
      });
    });
    docRef.updateData({
      "order" : FieldValue.arrayUnion(l)
    });
  }

  void removeItem(int index) async{
    Box box = await Hive.openBox(databasePurchaseList);
    List l = box.get(0);
    
    setState(() {
      itemList.removeAt(index);
    });
    await box.clear();
    await box.put(0,itemList);           
    
  }


  Widget buildPurchaseItem(data,index){
    int price = data.price * data.quatity; 
    String dishName = "${data.name}".toUpperCase();
    String url = data.url;

    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: 180.0,
      child: Stack(
        children: <Widget>[

           /* Elevated Card */
          
          Align(
              alignment:Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.6,
                height: 125.0,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    bottomLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                    bottomRight: Radius.circular(18.0),
                  ),
                  boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                ),
              ),
            ),

           /*Image Top Left*/

          Positioned(
            top: 0,
            left:0,
            child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(url)
                          )
                      )),
            ),

             /*Title*/

            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width:MediaQuery.of(context).size.width*0.5,
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top:40.0,left: 50.0),
                      child: Text(dishName,style: TextStyle(color:Colors.black,fontSize:20.0,fontWeight: FontWeight.bold)),
                ),
                  ),
              ),
            ),

             /*Price bottom */

            Align(
              alignment:Alignment.bottomCenter,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 35.0,left: 20.0),
                      child: Text("Rs. $price",style: TextStyle(color:Colors.blue[800],fontSize:22.0,fontWeight: FontWeight.bold))
                        ),
                    Container(
                      margin: EdgeInsets.only(bottom: 35.0,right: 10.0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () async{
                          removeItem(index);
                        },
                        child:Text("Delete",style: TextStyle(color:Colors.white,),),
                      ),
                    ),
                  ],
                ),
                            )
            )
            
        ],
      ),
    );
  }
 
}