import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pillset/views/registeration_view/signin_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            return _checkFirstTimeUser(context);
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget _checkFirstTimeUser(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isFirstTimeUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData && snapshot.data == true) {
          return const OnBoradingPage();
        } else {
          final user = AuthService.firebase().currentUser;
          if (user != null) {
            if (user.isEmailVerified) {
              return const MainScreen();
            } else {
              return const VerifyEmailView();
            }
          }
          return const SignInView();
        }
      },
    );
  }

  Future<bool> _isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('firstTime');
    if (isFirstTime == null || isFirstTime == false) {
      await prefs.setBool('firstTime', true);
      return true;
    }
    return false;
  }
}
