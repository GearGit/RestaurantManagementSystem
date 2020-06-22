import 'package:HOD_app/admin_ui/admin_home_page.dart';
import 'package:HOD_app/homepage.dart';
import 'package:HOD_app/services/auth_services.dart';
import 'package:HOD_app/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'forgetPasswordScreen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _errorMessage;
  bool _show;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController1 = TextEditingController();

  bool _isLoading;

  String email;

  Future<void> signInWithMail() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      setState(() {
        _isLoading = false;
        email = emailController.text;
      });

      widget.loginCallback();
      email == "hodapp@st.niituniversity.in"
      ? Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminMain()))
      : Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print('caught error $e');
      setState(() {
        _isLoading = false;
        _errorMessage = e.message;
        _show = true;
      });
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _show = false;
    email = "";
    super.initState();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onTap: () {
              _isLoading = false;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.blue),
              hintText: 'Email',
              hintStyle: kHintTextStyle,
            ),
            controller: emailController,
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onTap: () {
              _isLoading = false;
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
            controller: passwordController,
          ),
        ),
      ],
    );
  }

  Widget _buildForgetPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
        },
        child: Text(
          'Forget Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          signInWithMail();
        },
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.blueAccent,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/signUpPage');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showAlert() {
    if (_errorMessage != null && _show == true) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _errorMessage,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _errorMessage = null;
                    _show = false;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  AutoSizeText buildHeaderText() {
    String _headerText;
    return AutoSizeText(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35,
        color: Colors.white,
      ),
    );
  }

  Widget _showPage() {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.blueAccent,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgetPasswordBtn(),
                      //st_buildRememeberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignUpBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _showPage(),
          _showCircularProgress(),
          showAlert(),
        ],
      ),
    );
  }
}
