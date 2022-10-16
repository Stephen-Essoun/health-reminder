import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/commons/components/textfield.dart';

import '../../authentication/auth_exception.dart';
import '../../authentication/auth_service.dart';
import '../../commons/utils/error_dialogue.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/login.png'),
                )),
              ),
              Column(children: [
                Text(
                  'Welcome back',
                  style: textTheme.headline1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Login to your account',
                  style: textTheme.headline3!.copyWith(fontSize: 20),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      controller: emailController,
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      controller: passwordController,
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: green,
                        ),
                        child: const Text('Forgot password'),
                      ),
                    ),
                    SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.height / 1.5,
                        child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await AuthService.firebase().login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                final user = AuthService.firebase().currentUser;
                                if (user?.isEmailVerified ?? false) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    homeRoute,
                                    (route) => false,
                                  );
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    verifyEmailRoute,
                                    (route) => false,
                                  );
                                }
                              } on WrongPasswordAuthException {
                                showErrorDialog(
                                  context,
                                  'wrong password',
                                );
                              } on UserNotFoundAuthException {
                                showErrorDialog(
                                  context,
                                  'user not found',
                                );
                              } on GenericAuthException {
                                showErrorDialog(
                                  context,
                                  'Operation failed',
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                textStyle: const TextStyle(fontSize: 18)),
                            child: const Text('Login'))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account yet?",
                        style: TextStyle(
                          color: whiteGrey,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
