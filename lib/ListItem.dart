import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  ListItem({Key key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int counter;
  @override
  void initState() {
    // TODO: implement initState
    counter = 1;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    int price = 300;
    String dishName = "Chicken Biryani";

    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      height: 200.0,
      child: Stack(
        children: <Widget>[

           /* Elevated Card */
          
          Align(
              alignment:Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.7,
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
                      width: 75.0,
                      height: 75.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://www.naivecookcooks.com/wp-content/uploads/2016/08/slow-cooker-chicken-biryani-on-a-plate.jpg")
                          )
                      )),
            ),

             /*Title*/

            Align(
              alignment: Alignment.topCenter,
              child:Container(
                margin: EdgeInsets.only(top:20.0,left: 20.0),
                child: Text("$dishName",style: TextStyle(color:Colors.black,fontSize:24.0,fontWeight: FontWeight.bold)),
              ),
            ),

           /*Row to add or delete*/

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width:150.0,
                padding: EdgeInsets.only(right:10.0),
                margin: EdgeInsets.only(right:20.0,bottom:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                     /*Remove Button*/

                    Container(
                      width:26.0,
                      height:26.0,
                      child: RaisedButton(
                        // elevation: 8.0,
                        padding: EdgeInsets.only(right:4.0,left:4.0),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        onPressed: (){
                          setState(() {
                            (counter!=0) ? counter-- : counter = counter;
                          });
                        },
                        child: Icon(Icons.remove,color: Colors.white,size: 18.0,),
                      ),
                    ),

                     /*Quantity box*/

                    Container(
                      width: 50.0,
                      height:30.0,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius:BorderRadius.all(Radius.circular(12.0)),
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                      ),
                      child: Center(child: Text("$counter")),
                      ),

                    /*Add Button*/

                    Container(
                      width:26.0,
                      height:26.0,
                      child: RaisedButton(
                        // elevation: 8.0,
                        padding: EdgeInsets.only(right:4.0,left:4.0),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                        onPressed: (){
                          setState(() {
                            counter++;
                          });
                      },
                        child: Icon(Icons.add,color: Colors.white,size:18.0),
                      ),
                      ),

                  ],
                ),
              ),
              ),

             /*Price bottom left*/

            Align(
              alignment:Alignment.bottomLeft,
              child:Container(
                width: 100.0,
                  margin: EdgeInsets.only(left:40.0,right: 10.0,bottom: 15.0),
                  child: Text("Rs.$price per unit",style: TextStyle(color:Colors.blue[800],fontSize:22.0,fontWeight: FontWeight.bold))
                    )
            )
            
        ],
      ),
    );
  }
}