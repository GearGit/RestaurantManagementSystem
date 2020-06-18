import 'package:flutter/material.dart';
import 'package:HOD_app/ListItem2.dart';
class TestClass extends StatefulWidget {
  TestClass({Key key}) : super(key: key);

  @override
  _TestClassState createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
              unselectedLabelColor: Colors.redAccent,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.redAccent),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.redAccent, width: 2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("  ROLLS  "),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.redAccent, width: 2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("  MAINS  "),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.redAccent, width: 2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("  BREADS  "),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.redAccent, width: 2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("  STARTERS  "),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          ListItem2(),
          Icon(Icons.movie),
          Icon(Icons.games),
          Icon(Icons.movie),
        ]),
      ),
      );
  }
}