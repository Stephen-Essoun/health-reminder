import 'package:firebase_auth/firebase_auth.dart';

import 'auth_user.dart';

class Auth {
  // FirebaseAuth auth = FirebaseAuth();
}

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<AuthUser> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> sendEmailVerification();
}
