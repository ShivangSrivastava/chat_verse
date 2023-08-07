import 'package:chat_verse/services/auth/logout.dart';
import 'package:chat_verse/widgets/contact_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            [
              "Chat Verse".text.xl5.make(),
              IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: const Icon(Icons.logout),
              )
            ].hStack(alignment: MainAxisAlignment.spaceBetween),
            20.heightBox,
            _userList().expand()
          ],
        ).whFull(context).p32(),
      ),
    );
  }

  Widget _userList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return "Error".text.red500.make();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return "Loading...".text.blue500.make();
        }
        return ListView(
          children:
              snapshot.data!.docs.map<Widget>((e) => _userListItem(e)).toList(),
        );
      },
    );
  }

  Widget _userListItem(DocumentSnapshot document) {
    Map data = document.data() as Map;
    if (auth.currentUser!.email != data['emailAddress']) {
      return ContactCard(
        recieverUID: data['uid'],
        name: data['username'],
        senderUID: FirebaseAuth.instance.currentUser?.uid as String,
      );
    }
    return Container();
  }
}
