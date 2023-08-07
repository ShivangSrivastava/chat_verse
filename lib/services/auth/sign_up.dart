import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


signUp(String emailAddress, String password, String username) async {
  final auth = FirebaseAuth.instance;
  try {
    await auth
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) {
      FirebaseFirestore.instance.collection('users').add({
        "username": username,
        "emailAddress": emailAddress,
        "uid": auth.currentUser?.uid
      });
    });
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
  return null;
}
