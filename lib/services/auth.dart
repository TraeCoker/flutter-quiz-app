import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //listens for multiple async events. Good when you need user but don't know when
  final  userStream = FirebaseAuth.instance.authStateChanges();
  //listens for single async even. Good when you need the instance in that moment.
  final user = FirebaseAuth.instance.currentUser;


  //Anonymous Firebase Login
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      //handle error
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}