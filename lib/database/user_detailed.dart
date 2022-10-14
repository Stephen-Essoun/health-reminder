import 'package:cloud_firestore/cloud_firestore.dart';

Future userInfo(
  String name,
  String age,
  String email,
) async {
  await FirebaseFirestore.instance.collection('user').add({
    'name': name,
    'age': age,
    'email': email,
  });
}
