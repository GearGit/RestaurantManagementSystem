import 'package:flutter/material.dart';

class TestClass extends StatefulWidget {
  TestClass({Key key}) : super(key: key);

  @override
  _TestClassState createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Test page"),
    );
  }
}