
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<FirebaseUser> getCurrentUser();
}


class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getCurrentUser() async {
   FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  
}