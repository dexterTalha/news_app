import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  final BuildContext context;

  AuthController(this.context);

  //name="test", email="test@gmail.com"
  Future<User?> createAccount({String? name, String? email, String? password}) async {
    if (name == null || email == null || password == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill the required field")));
      return null;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The account already exists for that email.")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      return null;
    }
    return null;
  }
}
