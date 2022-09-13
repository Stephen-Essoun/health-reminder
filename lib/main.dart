import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/views/onboarding.dart';
import 'package:pillset/views/register_view.dart';
import 'package:pillset/views/signin_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: registerRoute,
    routes: {
      onBoardRoute: (context) => const OnBoradingPage(),
      signInRoute: (context) => const SignInView(),
      registerRoute:(context) => const RegisterView()
    },
    theme: ThemeData(primarySwatch: Colors.blue, textTheme: textTheme),
  ));
}
