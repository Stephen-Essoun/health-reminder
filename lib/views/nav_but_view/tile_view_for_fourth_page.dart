import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/loading.dart';

import '../../authentication/auth_service.dart';
import '../../commons/components/profile_listtile.dart';
import '../../commons/utils/colors.dart';
import '../../commons/utils/routes.dart';

class TileView extends StatelessWidget {
  const TileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Tile(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
                color: green,
              ),
            ),
            identifier: 'Settings',
            trailing: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkGrey,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        const Tile(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.info_outline,
                color: green,
              ),
            ),
            identifier: 'About App',
            trailing: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkGrey,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        const Tile(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.feedback_outlined,
                color: green,
              ),
            ),
            identifier: 'Feedback',
            trailing: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkGrey,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        const Tile(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.rule_outlined,
                color: green,
              ),
            ),
            identifier: 'Terms of use',
            trailing: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkGrey,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        const Tile(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.policy_outlined,
                color: green,
              ),
            ),
            identifier: 'Privacy policy',
            trailing: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkGrey,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Tile(
          onPressed: () async {
            showLoadingDialog(context);
          Future.delayed(const Duration(seconds: 1),()async { await AuthService.firebase().logout().then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                    context,
                    signInRoute,
                    (route) => false,
                  ),
                );});
          },
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.logout_outlined,
              color: green,
            ),
          ),
          identifier: 'Logout',
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: darkGrey,
            ),
          ),
        )
      ],
    );
  }
}
