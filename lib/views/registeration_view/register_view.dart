// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/loading.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/database/user_detailed.dart';
import '../../authentication/auth_exception.dart';
import '../../authentication/auth_service.dart';
import '../../commons/components/textfield.dart';
import '../../commons/utils/colors.dart';
import '../../commons/utils/error_dialogue.dart';
import '../../commons/utils/text_theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

String email = 'you@example.com';
String fullName = 'Null';
String get mail => email;
String get name => fullName;

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController ageController;
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    ageController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Register',
                    style: textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create your new account',
                    style: textTheme.headline3!.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  controller: nameController,
                  labelText: 'Full Name',
                  validator: (p0) {
                    String patttern = r'^[a-z A-Z,.\-]+$';
                    RegExp regExp = RegExp(patttern);
                    if (p0!.isEmpty) {
                      return 'Please enter full name';
                    } else if (!regExp.hasMatch(p0)) {
                      return 'Please enter valid full name';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.person_outlined),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  controller: emailController,
                  labelText: 'Email',
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!p0.contains('@')) {
                      return 'Please check your email';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  controller: ageController,
                  labelText: 'Age',
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'How old are you';
                    }
                    if (p0.contains('abcdefghijklmnopqrstuvwxyz')) {
                      return 'no nubers';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  keyboardType: TextInputType.multiline,
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (p0.length < 6) {
                      return 'weak password';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  keyboardType: TextInputType.multiline,
                  controller: cPasswordController,
                  obscureText: true,
                  labelText: 'Comfirm password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'confirm password';
                    }
                    if (val != passwordController.text) {
                      return 'Password mismatch';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'By signing you agree to our ',
                          style: TextStyle(
                            color: green,
                          ),
                          children: [
                            TextSpan(
                                text: 'term of use',
                                style: TextStyle(
                                  color: whiteGrey,
                                )),
                            TextSpan(
                                text: '\nand ',
                                style: TextStyle(
                                  color: green,
                                )),
                            TextSpan(
                                text: 'privacy notice.',
                                style: TextStyle(
                                  color: whiteGrey,
                                ))
                          ])),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.height / 1.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showLoadingDialog(context);
                        try {
                          await AuthService.firebase()
                              .createUser(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            email = emailController.text;
                            fullName = nameController.text;
                            UDBase().createUserInfo(
                              name: nameController.text,
                              age: ageController.text,
                              email: emailController.text,
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                verifyEmailRoute, (route) => false);
                          });
                          // final user = AuthService.firebase().currentUser;
                          // AuthService.firebase().sendEmailVerification();
                        } on WeakPasswordAuthException {
                          showErrorDialog(context, 'weak password');
                        } on EmailAlreadyInUseAuthException {
                          showErrorDialog(
                            context,
                            'Email is already in use',
                          );
                        } on GenericAuthException {
                          
                          showErrorDialog(
                            context,
                            'Failed to register',
                          );
                        } on InvalidEmailAuthException {
                          showErrorDialog(
                            context,
                            'Enter a valid email address',
                          );
                        }finally{
                          hideLoadingDialog(context);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        textStyle: const TextStyle(fontSize: 18)),
                    child: const Text('Register'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(signInRoute),
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: const TextSpan(
                          text: "Already a member?",
                          style: TextStyle(
                            color: whiteGrey,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login.',
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
      ),
    );
  }

}
