import 'package:HOD_app/admin_ui/item.dart';
import 'package:HOD_app/detail_page.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final Item data;
  MenuItem({Key key,this.data}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  int counter;
  @override
  void initState() {
    // TODO: implement initState
    counter = 1;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    int price = widget.data.price;
    String type = widget.data.isVeg?" (VEG)":" (NON-VEG)";
    String dishName = "${widget.data.name + type}".toUpperCase();
    String url = widget.data.url;

    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: 225.0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(data: widget.data,)));
        },
        child: Stack(
          children: <Widget>[

             /* Elevated Card */
            
            Align(
                alignment:Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.6,
                  height: 175.0,
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
                        margin: EdgeInsets.only(top:30.0,left: 45.0),
                        child: Text(dishName,style: TextStyle(color:Colors.black,fontSize:20.0,fontWeight: FontWeight.bold)),
                  ),
                    ),
                ),
              ),

               /*Price bottom left*/

              Align(
                alignment:Alignment.bottomCenter,
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 35.0),
                    child: Text("Rs. $price",style: TextStyle(color:Colors.blue[800],fontSize:22.0,fontWeight: FontWeight.bold))
                      ),
                              )
              )
              
          ],
        ),
      ),
    );
  }
}