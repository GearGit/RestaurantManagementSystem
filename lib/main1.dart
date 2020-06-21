import 'package:HOD_app/Invoice.dart';
import 'package:HOD_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DriveClass());
}

class DriveClass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOD APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        
        body: Center(
          child:InvoicePage()
      ),
      ),
    );
  }
}
