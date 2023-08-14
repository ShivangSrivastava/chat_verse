// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:chat_verse/services/chat/chats.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String recieverUID;
  final String senderUID;
  const ChatPage({
    Key? key,
    required this.name,
    required this.recieverUID,
    required this.senderUID,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  late final Stream<QuerySnapshot> chats;
  @override
  void initState() {
    super.initState();
    chats = ChatService().getMessages(widget.senderUID, widget.recieverUID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back),
              ),
              widget.name.text.xl3.make().px16()
            ],
          ),
          20.heightBox,
          StreamBuilder(
            stream: chats,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return "Error".text.make();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return "Loading".text.make();
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ChatBubble(
                    message: data['message'],
                    send: (FirebaseAuth.instance.currentUser?.uid ==
                        data['senderID']),
                    timestamp: data['timestamp'],
                  );
                }).toList(),
              );
            },
          ).expand(),
          Row(
            children: [
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 23,
                  ),
                  hintText: "Message",
                ),
              ).expand(),
              IconButton(
                onPressed: () {
                  if (_messageController.text.isNotEmptyAndNotNull) {
                    setState(() {
                      ChatService().sendMessage(
                          widget.recieverUID, _messageController.text);
                      _messageController.clear();
                    });
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: Vx.green500,
                ),
              ),
            ],
          ),
        ],
      ).whFull(context).p12(),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool send;
  final Timestamp timestamp;
  const ChatBubble({
    Key? key,
    required this.message,
    required this.send,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          (send) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 15),
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 270,
              minHeight: 40,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (send) ? Vx.orange500 : Vx.blue500,
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: (send)
                      ? const Radius.circular(20)
                      : const Radius.circular(0),
                  bottomRight: (send)
                      ? const Radius.circular(0)
                      : const Radius.circular(20)),
              color:
                  (send) ? Vx.hexToColor("#272A35") : Vx.hexToColor("#373E4E"),
            ),
            child: message.text.xl.center.make(),
          ),
          "${timestamp.toDate().hour}:${timestamp.toDate().minute}"
              .text
              .xs
              .make()
              .px16()
        ].vStack(
            crossAlignment:
                (send) ? CrossAxisAlignment.end : CrossAxisAlignment.start)
      ],
    );
  }
}
