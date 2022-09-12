import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/views/onboarding.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: onBoardRoute,
    routes: {
      onBoardRoute :(context) =>const OnBoradingPage(), 
    },
     theme:ThemeData(
      primarySwatch: Colors.blue,
      textTheme: textTheme
    ),
  ));
}
