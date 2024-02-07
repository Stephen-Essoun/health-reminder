import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UDBase {
  final CollectionReference _db =
      FirebaseFirestore.instance.collection('users');

  // Method to create user information
  Future<void> createUserInfo({
    required String? name,
    required String? age,
    required String? email,
  }) async {
    try {
      // Add user information under 'users' collection with email as document ID
      await _db.doc(email).set({
        'name': name,
        'age': age,
        'email': email,
      });
    } catch (error) {
      print('Error creating user info: $error');
    }
  }

  // Method to retrieve user ID
  Future<String?> getUserId() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      print('user -======- ${user?.email}');
      return user?.email; // Returning email as the unique identifier
    } catch (error) {
      print('Error getting user ID: $error');
      return null;
    }
  }

  // Method to read user information based on email
  Future<Map<String, dynamic>?> readUserInfo() async {
    try {
      final email = await getUserId();
      if (email != null) {
        // Retrieve user information document using email
        DocumentSnapshot<Object?> userSnapshot = await _db.doc(email).get();
        print('user ===== $userSnapshot');
        if (userSnapshot.exists) {
          // Return user information as a Map
          return userSnapshot.data() as Map<String, dynamic>;
        } else {
          print('User document does not exist');
          return null;
        }
      } else {
        print('User email is null');
        return null;
      }
    } catch (error) {
      print('Error reading user info: $error');
      return null;
    }
  }
}
