// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pillset/authentication/auth_service.dart';
import 'package:pillset/commons/utils/error_dialogue.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/views/registeration_view/register_view.dart';

import '../../commons/utils/colors.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "By pressing",
            ),
            TextButton(
              onPressed: () async {
                try {
                  await AuthService.firebase().sendEmailVerification();
                  if (mounted) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(signInRoute, (route) => false);
                  }
                } catch (e) {
                  // Handle any errors that occur during sendEmailVerification
                  showErrorDialog(
                      context, 'Error sending email verification: \nPlease try again in a minute time');
                }
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: green,
                  textStyle: const TextStyle(fontSize: 15)),
              child: const Text(
                'request another email verification',
              ),
            ),
            const Text(
              "A verification mail will be sent to ",
            ),
            Text(
              ' $mail',
              style: textTheme.headline2,
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logout().then((value) =>
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        signInRoute, (route) => false));
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: green,
                  textStyle: const TextStyle(fontSize: 15)),
              child: const Text('restart'),
            ),
            const Text("Restart to login or verify later"),
          ],
        ),
      ),
    );
  }
}
