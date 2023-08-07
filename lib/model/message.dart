// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String recieverID;
  final String senderEmail;
  final String message;
  final Timestamp timestamp;
  Message({
    required this.senderID,
    required this.recieverID,
    required this.senderEmail,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderID': senderID,
      'recieverID': recieverID,
      'senderEmail': senderEmail,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
