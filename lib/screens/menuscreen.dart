import 'package:HOD_app/widgets/menuitem.dart';
import 'package:HOD_app/admin_ui/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  TabController _tabController;
  List<dynamic> _list;

  @override
  void initState() {
    _list = null;
    getCategories();
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("food_menu").document("item").snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
            DocumentSnapshot items = snapshot.data;
            List<dynamic> allItems = items.data["item"];
          if(allItems != null){

            List breadItems = [];
            List mainCourseItems = [];
            List rollsItems = [];
            List startersItems = [];

            allItems.forEach((element) {
              if(element["category"] == "breads"){
                breadItems.add(Item.fromSnapshot(element));
              }else
              if(element["category"] == "mains"){
                mainCourseItems.add(Item.fromSnapshot(element));
              }else
              if(element["category"] == "rolls"){
                rollsItems.add(Item.fromSnapshot(element));
              }else
              if(element["category"] == "starters"){
                startersItems.add(Item.fromSnapshot(element));
              }
            });

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
                  "HOD : Food & Delivery",
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
                        text: "BREADS",
                      ),
                      Tab(
                        text: "MAIN COURSE",
                      ),
                      Tab(
                        text: "ROLLS",
                      ),
                      Tab(
                        text: "STARTERS",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    RightBody(data:breadItems),
                    RightBody(data:mainCourseItems),
                    RightBody(data:rollsItems),
                    RightBody(data:startersItems),
                    // RightBody(),
                    // RightBody(),
                  ],
                ),
              )
            ],
          ),
        );
          } 
      }else{
            return Container();
          }
      }
    );

  }
  
  Future getCategories() async{
    DocumentSnapshot snap = await Firestore.instance.collection("food_menu").document("categories").get();
    List<dynamic> data = snap.data["all_categories"];
    setState(() {
      _list = data;
    });
  }

  Widget makeTab(data){
    return Tab(text: data,);
  }
}


class RightBody extends StatelessWidget {
  
  final List data;
  RightBody({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 5,
      ),
      color: Colors.white,
      child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 5,);
        }, 
        itemBuilder: (context, index) {
          return MenuItem(data:data[index]);
        },
        ),
    );
  }
}
