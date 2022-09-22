import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/views/main_screen.dart';
import 'package:pillset/views/onboarding.dart';
import 'package:pillset/views/register_view.dart';
import 'package:pillset/views/signin_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    onBoardRoute;
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: onBoardRoute,
    routes: {
      onBoardRoute: (context) => const OnBoradingPage(),
      signInRoute: (context) => const SignInView(),
      registerRoute: (context) => const RegisterView(),
      homeRoute:(context) => const MainScreen()
    },
  );
  }
}


