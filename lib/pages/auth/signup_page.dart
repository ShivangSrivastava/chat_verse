import 'package:chat_verse/pages/chat/chat_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../services/auth/sign_up.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                      controller: _nameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Name is too small";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(CupertinoIcons.person_solid),
                        hintText: "e.g. Shivang",
                        label: "Name".text.make(),
                      ),
                    ),
                    20.heightBox,
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
                        prefixIcon: const Icon(CupertinoIcons.mail_solid),
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
                    20.heightBox,
                    TextFormField(
                      controller: _confirmpasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password is too small";
                        }
                        if (value != _passwordController.text) {
                          return "Password mismatch";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          CupertinoIcons.lock_fill,
                        ),
                        hintText: "Confirm Password",
                        label: "Confirm Password".text.make(),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _signUp,
                    child: "Sign Up".text.make(),
                  ).expand(),
                ],
              ),
            ],
          ).px32(),
          Positioned(
            bottom: 10,
            child: Row(
              children: [
                "Already have account?".text.make(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: "Sign In".text.make(),
                ),
              ],
            ),
          ),
        ],
      ).whFull(context),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      signUp(_emailController.text, _passwordController.text,
              _nameController.text)
          .then((message) {
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
