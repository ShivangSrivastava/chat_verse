// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../pages/chat/chat_page.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String senderUID;
  final String recieverUID;
  const ContactCard({
    Key? key,
    required this.name,
    required this.senderUID,
    required this.recieverUID, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              name: name,
              recieverUID: recieverUID,
              senderUID: senderUID,

            ),
          ),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(30, 229, 231, 235),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.person_fill,
                size: 30,
              ),
              20.widthBox,
              name.text.xl2.make(),
            ],
          )),
    );
  }

 
}
