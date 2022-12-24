import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../authentication/auth_service.dart';
import '../views/main_screen.dart';
import '../views/onboarding_view/onboarding.dart';
import '../views/registeration_view/verify_email_view.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const MainScreen();
              } else {
                return const VerifyEmailView();
              }
            }
            return const OnBoradingPage();
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
