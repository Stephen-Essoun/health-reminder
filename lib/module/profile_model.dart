import 'package:flutter/material.dart';
import 'package:pillset/authentication/auth_service.dart';
import 'package:pillset/commons/utils/colors.dart';

class Tile {
  Widget leading;
  String identifier;
  Widget trailing;
  void Function()? onPressed;
  Tile({
    this.onPressed,
    required this.leading,
    required this.identifier,
    required this.trailing,
  });
}

List pmodel = [
  Tile(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.settings,
          color: green,
        ),
      ),
      identifier: 'Settings',
      trailing: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: darkGrey,
        ),
      )),
  Tile(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.info_outline,
          color: green,
        ),
      ),
      identifier: 'About App',
      trailing: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: darkGrey,
        ),
      )),
  Tile(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.feedback_outlined,
          color: green,
        ),
      ),
      identifier: 'Feedback',
      trailing: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: darkGrey,
        ),
      )),
  Tile(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.rule_outlined,
          color: green,
        ),
      ),
      identifier: 'Terms of use',
      trailing: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: darkGrey,
        ),
      )),
  Tile(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.policy_outlined,
          color: green,
        ),
      ),
      identifier: 'Privacy policy',
      trailing: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: darkGrey,
        ),
      )),
  Tile(
      onPressed: () async {
        await AuthService.firebase().logout();
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
      ))
];
