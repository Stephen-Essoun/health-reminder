import 'package:flutter/material.dart';
import '../commons/components/textfield.dart';
import '../commons/utils/colors.dart';
import '../commons/utils/text_theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
                  style: textTheme.headline3!.copyWith(fontSize: 20),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              InputField(
                controller: nameController,
                labelText: 'Full Name',
                prefixIcon: const Icon(Icons.person_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 15,
              ),
              InputField(
                controller: cPasswordController,
                labelText: 'Comfirm password',
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
                height: 180,
              ),
              SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.height / 1.5,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: const TextStyle(fontSize: 18)),
                      child: const Text('Login'))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {},
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
                            text: 'Register.',
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
