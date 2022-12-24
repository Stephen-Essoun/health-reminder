import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/providers/auth_state.dart';
import 'package:pillset/providers/click_to_swap_provider.dart';
import 'package:pillset/views/home_view.dart';
import 'package:pillset/views/main_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'views/onboarding_view/onboarding.dart';
import 'views/registeration_view/register_view.dart';
import 'views/registeration_view/signin_view.dart';
import 'views/registeration_view/verify_email_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => Clicked())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: const AuthState(),
        // initialRoute: signInRoute,
        routes: {
          onBoardRoute: (context) => const OnBoradingPage(),
          signInRoute: (context) => const SignInView(),
          registerRoute: (context) => const RegisterView(),
          homeRoute: (context) => const HomeView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
          mainScreen: (context) => const MainScreen()
        },
      ),
    );
  }
}
