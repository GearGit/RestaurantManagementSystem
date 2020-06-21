import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}



class _HelpPageState extends State<HelpPage> {
  String msg = 'Hey Can I Check The Status Of My Order Number xxxxxxxxxx';
  String base64Image = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Center(child: Text('PRESS FOR HELP')),

    ),
    floatingActionButton: FloatingActionButton(
  onPressed: () {
    FlutterShareMe().shareToWhatsApp(base64Image: base64Image, msg: msg);
  },

    )
    );
  }
}