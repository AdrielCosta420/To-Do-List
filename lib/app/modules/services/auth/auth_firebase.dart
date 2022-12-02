// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthFirebase() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
    });
  }
}
