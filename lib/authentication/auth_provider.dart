import 'auth_user.dart';
 
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
