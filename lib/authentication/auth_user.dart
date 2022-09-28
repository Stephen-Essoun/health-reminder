 import 'package:firebase_auth/firebase_auth.dart';

class AuthUser{
  final bool isEmailVerified;
 const AuthUser({required this.isEmailVerified});

 factory  AuthUser.fromFirebase(User user) => AuthUser( isEmailVerified: user.emailVerified,);
}