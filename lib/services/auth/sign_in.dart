import 'package:firebase_auth/firebase_auth.dart';

Future<String?> signIn(String emailAddress, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
  return null;
}
