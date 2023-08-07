import 'package:chat_verse/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  sendMessage(String recieverID, String message) async {
    final String currentUserID = _auth.currentUser?.uid as String;
    final String currentUserEmail = _auth.currentUser?.email as String;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderID: currentUserID,
        recieverID: recieverID,
        senderEmail: currentUserEmail,
        message: message,
        timestamp: timestamp);

    List ids = [recieverID, currentUserID];
    ids.sort();

    String chatRoomId = ids.join("_");

    await _firestore
        .collection("chat_room")
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String uid, String otherUserId) {
    List ids = [uid, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection("chat_room")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
