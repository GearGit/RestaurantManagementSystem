import 'package:HOD_app/ListItem.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  InvoicePage({Key key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(          
          // floatingActionButton: FloatingActionButton.extended(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(20),
          //           bottomLeft: Radius.circular(20),
          //         ), 
          //   ),
          //   icon:Icon(Icons.check),
          //   label:Text("Checkout",style: TextStyle(color:Colors.white,fontWeight:FontWeight.w400,fontStyle:FontStyle.italic),),
          //   backgroundColor: Color(0xff1B3F8B),
          //   onPressed: (){}
          //   ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          
          body:
           NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              expandedHeight: 100.0,
              pinned:false,
              backgroundColor: Colors.white,
              title: Container(
                height: 50,
                margin: EdgeInsets.only(top:60.0,bottom:20,left: 10.0),
                child: Text("INVOICE",style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300,color: Colors.black),)),
              // centerTitle: true,
            )
          ];
        },
        body: Container(
        width: MediaQuery.of(context).size.width*0.8,
        margin: EdgeInsets.only(bottom:60.0),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height:15.0);
          },
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index){
            return ListItem();
          }),
          )
      ),
    );
  }
 
}