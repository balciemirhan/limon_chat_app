// service

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // instance of auth (tüm işlevselliğe sahip olacağız)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in

  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    /*  return _auth.signInWithEmailAndPassword(email: email, password: password); */

    // herhangi bir hata varsa try-catch ile yakalayalım.
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // sign up

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out

  Future<void> signOut(context) async {
    return await _auth
        .signOut()
        .then((value) => Navigator.of(context).pushNamed("/loginOrRegister"));
  }

  // errors

  // Google Authentication sign in
}
