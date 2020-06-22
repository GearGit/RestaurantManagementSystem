import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color: Colors.blue,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(350.0),
                      topRight: Radius.circular(50.0),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 90.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
                Positioned(
                top: (MediaQuery.of(context).size.height / 2) - 200.0,
                left: (MediaQuery.of(context).size.width / 2) - 105.0,
                child: Image(
                  image: AssetImage('assets/images/'), // Kuch photo if you wanna add somu
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height - 300,
                    left: 20.0,
                    right: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "HOD",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)),
                            TextSpan(
                                text:
                                    "    Food                             "),
                            TextSpan(
                              text: "Idhar kuch bhi likh lenaa sir"
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    ),);
  }
}
