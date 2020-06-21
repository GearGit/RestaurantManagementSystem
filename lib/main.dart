
import 'package:HOD_app/Invoice.dart';
import 'package:HOD_app/admin_ui/admin_home_page.dart';
import 'package:HOD_app/admin_ui/create_item.dart';
import 'package:HOD_app/homepage.dart';
import 'package:HOD_app/screens/forgetPasswordScreen.dart';
import 'package:HOD_app/screens/loginScreen.dart';
import 'package:HOD_app/screens/rootPage.dart';
import 'package:HOD_app/screens/signUpPage.dart';
import 'package:HOD_app/services/auth_services.dart';

import 'package:flutter/material.dart';

import 'main1.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOD APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: RootPage(auth: new Auth()),
      home: DriveClass(),
      // home: AdminMain(),
      routes: <String, WidgetBuilder> {
        '/RootPage' : (context) => RootPage(),
        '/signUpPage' : (context) => SignUpScreen(),
        '/homePage' : (context) => DriveClass(),
        '/forgetPassword' : (context) => ForgetPasswordScreen(),
        '/loginScreen': (context) => LoginScreen(),
      },
    );
  }
}