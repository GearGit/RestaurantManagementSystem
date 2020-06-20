import 'package:HOD_app/Invoice.dart';
import 'package:HOD_app/Productinfor.dart';
import 'package:HOD_app/custom_drawer.dart';
import 'package:HOD_app/testclass4.dart';
import 'package:HOD_app/testclass5.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CustomDrawer customDrawer;
  int widgetIndex2=0;
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    customDrawer = CustomDrawer(this.callback);

    currentPage = customDrawer;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left:70),
                  child:
            IndexedStack(
            index:widgetIndex2,
            children:[RightWidget(),Productinfor(),InvoicePage(),TestClass4(),HelpPage()],
            ),
              ),
            currentPage,
          ],
        ),
      ),
    );
  }
  void callback(int i) {
    setState(() {
      this.widgetIndex2= i;
    });
  }
}


class RightWidget extends StatefulWidget {
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Text(
              "Food & Delivery",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: SizedBox(
              height: 30,
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: Color(0xffED305A),
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Color(0x55B71C1C),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Asian",
                  ),
                  Tab(
                    text: "American",
                  ),
                  Tab(
                    text: "French",
                  ),
                  Tab(
                    text: "Mexico",
                  ),
                  Tab(
                    text: "Japan",
                  ),
                  Tab(
                    text: "China",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                RightBody(),
                RightBody(),
                RightBody(),
                RightBody(),
                RightBody(),
                RightBody(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Near you",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 100,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    color: Color(0xffED305A),
                    borderRadius: BorderRadius.circular(
                      30,
                    )),
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
