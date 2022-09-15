import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/views/main_screen.dart';
import 'package:pillset/views/onboarding.dart';
import 'package:pillset/views/register_view.dart';
import 'package:pillset/views/signin_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: homeRoute,
    routes: {
      onBoardRoute: (context) => const OnBoradingPage(),
      signInRoute: (context) => const SignInView(),
      registerRoute: (context) => const RegisterView(),
      homeRoute:(context) => const MainScreen()
    },
  ));
}
