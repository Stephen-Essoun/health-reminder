import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final user = FirebaseAuth.instance.currentUser;

  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> createUser(String email, String password) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      print(_.code);
    }
  }
}
