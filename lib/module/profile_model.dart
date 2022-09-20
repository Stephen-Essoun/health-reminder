import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';

class PModel {
  Widget leading;
  String identifier;
  Widget trailing;
  PModel(
      {required this.leading,
      required this.identifier,
      required this.trailing});
}

List pmodel = [
  PModel(
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
  PModel(
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
  PModel(
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
  PModel(
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
  PModel(
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
  PModel(
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
