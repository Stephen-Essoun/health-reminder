import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pillset/authentication/auth_service.dart';
import 'package:pillset/authentication/auth_user.dart';

class UDBase {
  CollectionReference db = FirebaseFirestore.instance.collection('users');
  Future createUserInfo(
    {String? name,
    String ?age,
    String ?email,
    String? id}
  ) async {
    await db.doc().set({
      'name': name,
      'age': age,
      'email': email,
    });
  }

  Future readUserInfo()async{
    // final user = FirebaseAuth.instance.currentUser;
      db.id;
  }
}
