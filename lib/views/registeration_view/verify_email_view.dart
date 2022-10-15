import 'package:flutter/material.dart';
import 'package:pillset/authentication/auth_service.dart';
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
                await AuthService.firebase()
                    .sendEmailVerification()
                    .then((value) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(signInRoute, (route) => false);
                });
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: green,
                  textStyle: const TextStyle(fontSize: 15)),
              child: const Text(
                'request email verification',
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
                        registerRoute, (route) => false));
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: green,
                  textStyle: const TextStyle(fontSize: 15)),
              child: const Text('restart'),
            ),
            const Text("Restart to cancel and verify later"),
          ],
        ),
      ),
    );
  }
}
