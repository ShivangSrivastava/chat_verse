import 'package:chat_verse/pages/chat/chat_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'auth/signin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (currentUser != null) {
                return const ChatHome();
              } else {
                return const SignInPage();
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/logo.png")
              .wPCT(
                context: context,
                widthPCT: 40,
              )
              .centered(),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "MADE WITH ".text.xl.make(),
                "❤️".text.color(Vx.red500).xl4.make()
              ],
            ).wFull(context),
          )
        ],
      ),
    );
  }
}
