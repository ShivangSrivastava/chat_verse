import 'package:chat_verse/pages/auth/signup_page.dart';
import 'package:chat_verse/pages/chat/chat_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../services/auth/sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  "Chat Verse".text.xl5.make().py32(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.length < 8) {
                                  return "Email is invalid";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(CupertinoIcons.mail_solid),
                                hintText: "example@gmail.com",
                                label: "Email".text.make(),
                              ),
                            ),
                            20.heightBox,
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.length < 8) {
                                  return "Password is too small";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock_fill,
                                ),
                                hintText: "Password",
                                label: "Password".text.make(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: _signIn,
                            child: "Sign In".text.make(),
                          ).expand(),
                        ],
                      ),
                    ],
                  ).px32(),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: [
                        "New here?".text.make(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: "Sign Up now".text.make(),
                        ),
                      ],
                    ),
                  ),
                ],
              ).whFull(context);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      signIn(
        _emailController.text,
        _passwordController.text,
      ).then((message) {
        if (message != null) {
          VxToast.show(
            context,
            msg: message,
            textColor: context.textTheme.displayMedium?.color,
          );
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatHome(),
              ));
        }
      });
    }
  }
}
