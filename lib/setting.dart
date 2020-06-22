import 'package:HOD_app/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("SETTINGS",style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300,color: Colors.black),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 8.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(8.0)),
                ),
                child: ListTile(
                  title: Text("About Us"),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUs(),));
                  },
                )),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                dialog();
              },
              color: Colors.red,
              child: Text("LogOut",style:TextStyle(color: Colors.white)),
            ),
          )
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
}