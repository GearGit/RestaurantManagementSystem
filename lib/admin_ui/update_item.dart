import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateItemPage extends StatefulWidget {
  UpdateItemPage({Key key}) : super(key: key);

  @override
  _UpdateItemPageState createState() => _UpdateItemPageState();
}

class _UpdateItemPageState extends State<UpdateItemPage> {

  final itemNameController = TextEditingController();
  final itemCostController = TextEditingController();
  final itemQuantityController = TextEditingController();
  final itemUrlController = TextEditingController();
  String category;

  int radioVal = -1;

  final FocusNode _nameFocus = FocusNode();  
  final FocusNode _costFocus = FocusNode();  
  final FocusNode _quantityFocus = FocusNode();
  final FocusNode _urlFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  final _confirmaionSnackBar = SnackBar(content: Text('Item Updated !!!',textAlign: TextAlign.center,));
  final _incompleteSnackBar = SnackBar(content: Text('All fields need to be filled',textAlign: TextAlign.center,));

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            icon: Icon(Icons.update),
            label:Text("Update Item",style: TextStyle(color:Colors.white,fontWeight:FontWeight.w400,fontStyle:FontStyle.italic),),
            backgroundColor: Color(0xff1B3F8B),
            onPressed: ()=>handleSubmit()
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      key: _scaffoldKey,
      resizeToAvoidBottomInset:true,
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            /* Title of page */
            
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.black),
                    onPressed: (){
                      Navigator.of(context).pop();
                    }),
                ),
                Padding(
                  padding: EdgeInsets.only(left:30.0,right:30.0,top:50.0,bottom:30.0),
                  child: Text("Update Item Details",style: TextStyle(color:Colors.black,fontSize:28.0,fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            /* Enter item name */ 

            Container(
              padding: EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child: TextFormField(
                controller: itemNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _nameFocus,
                onFieldSubmitted: (term){
                  _fieldFocusChange(context, _nameFocus, _costFocus);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.fastfood),
                  hintText: 'Name of the food item',
                  labelText: 'Item Name *',
                ),
                onSaved: (String value) {
                },
              )
            ),

            /*Enter item Cost*/ 

            Container(
              padding: EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child: TextFormField(
                  controller: itemCostController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _costFocus,
                onFieldSubmitted: (term){
                  _fieldFocusChange(context, _costFocus, _quantityFocus);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  hintText: 'Cost of the food item',
                  labelText: 'Item Cost *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
              )
            ),

            /*Enter item Quantity*/ 

            Container(
              padding: EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child: TextFormField(
                  controller: itemQuantityController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _quantityFocus,
                onFieldSubmitted: (term){
                  _fieldFocusChange(context, _quantityFocus, _urlFocus);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.add),
                  hintText: 'Quantity of the food item',
                  labelText: 'Item Quantity *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
              )
            ),

            /*Enter item URL*/ 
            
            Container(
              padding: EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child: TextFormField(
                  controller: itemUrlController,
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                focusNode: _urlFocus,
                onFieldSubmitted: (term){
                  _fieldFocusChange(context, _urlFocus, _descriptionFocus);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.image),
                  hintText: 'Image URL of the food item',
                  labelText: 'Item Image URL *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
              )
            ),


            Container(
              padding: EdgeInsets.only(left:20.0,right:20.0,top:20.0),
              child: new DropdownButton<String>(
                hint: Text("Select a catgory"),
                value: category,
                items: <String>['breads', 'mains', 'rolls', 'starters'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (str) {
                  print(str);
                  setState(() {
                    category = str;
                  });
                },
              ),
            ),


            /*Enter item type*/ 

            Container(
              padding: EdgeInsets.only(left:20.0,right:20.0,top:20.0),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 0, 
                    groupValue: radioVal, 
                    onChanged: (int newValue){
                      setState(() {
                        radioVal = newValue;
                      });
                    }),
                    Text("Non-Veg"),
                  Radio(
                    value: 1, 
                    groupValue: radioVal, 
                    onChanged: (int newValue){
                      setState(() {
                        radioVal = newValue;
                      });
                    }),
                    Text("Veg"),
                ],
              )
            ),


          ],
        ),
      ),
    );
  }
  void handleSubmit()async{
    
    String name = itemNameController.text;
    String cost = itemCostController.text;
    String quantity = itemQuantityController.text;
    String url = itemUrlController.text;
    String type;
    if(name.trim() != "" && cost.trim() != "" && quantity.trim() != "" && url.trim() != "" && radioVal != -1){

      if(radioVal == 0){
        type = "n";
      }else{
        type = "v";
      }
      print("Item Name : "+name+"\n");
      print("Item Cost : "+cost+"\n");
      print("Item Qty : "+quantity+"\n");
      print("Item URL : "+url+"\n");
      print("Item Type : "+type+"\n");
      print("Item category : "+category+"\n");
      
      _scaffoldKey.currentState.showSnackBar(_confirmaionSnackBar);
    }else{
      _scaffoldKey.currentState.showSnackBar(_incompleteSnackBar);
    }
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
  }

  void updateData(String n) async{
    DocumentReference ref = Firestore.instance.collection("food_menu").document("item");
    DocumentSnapshot doc = await ref.get();
    List items = doc.data["item"];
    items.forEach((element) {
      // if(element["name"] == n){
      //   ref.updateData({
      //     "item":
      //   });
      // }
    });
  }
}