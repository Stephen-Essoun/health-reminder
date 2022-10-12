import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/views/home_view.dart';
 import 'package:pillset/views/main_screen.dart';
import 'authentication/auth_service.dart';
import 'firebase_options.dart';
import 'views/onboarding_view/onboarding.dart';
import 'views/registeration_view/register_view.dart';
import 'views/registeration_view/signin_view.dart';
import 'views/registeration_view/verify_email_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:const HomePage(),
    // initialRoute: signInRoute,
    routes: {
      onBoardRoute: (context) => const OnBoradingPage(),
      signInRoute: (context) => const SignInView(),
      registerRoute: (context) => const RegisterView(),
      homeRoute: (context) => const MainScreen(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
