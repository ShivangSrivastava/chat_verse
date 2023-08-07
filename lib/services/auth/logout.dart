import 'package:chat_verse/pages/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

logout(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) {
      return const SplashScreen();
    },
  ));
}
