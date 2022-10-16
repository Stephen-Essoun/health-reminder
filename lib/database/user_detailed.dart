import 'package:cloud_firestore/cloud_firestore.dart'; 

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
