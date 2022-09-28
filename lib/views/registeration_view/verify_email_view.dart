import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';

import '../../authentication/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "We've sent you an email verification.\nPlease open it to verify your account",
          ),
          const Text(
              "If you haven't recieve an email yet,click the link below"),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification().then(
                  (value) => Navigator.of(context)
                      .pushNamedAndRemoveUntil(signInRoute, (route) => false));
            },
            child: const Text(
              'Send email verification',
            ),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logout().then((value) =>
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      registerRoute, (route) => false));
            },
            child: const Text('restart'),
          ),
        ],
      ),
    );
  }
}
