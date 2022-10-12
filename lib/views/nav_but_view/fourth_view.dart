import 'package:flutter/material.dart';
import 'package:pillset/authentication/auth_service.dart';
import 'package:pillset/commons/components/appbar.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';

import '../../commons/utils/routes.dart';
import '../../module/profile_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  final int isLastIndex = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApBar(title: 'Profile'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: Row(
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: white,
                      backgroundImage: AssetImage('images/avatar.png'),
                      radius: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Benedict',
                        style: textTheme.headline1!.copyWith(fontSize: 20),
                      ),
                      Text('A lot of words these days',
                          style: textTheme.headline2),
                    ],
                  )
                ],
              ),
            ),
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
            Tile(
                onPressed: () async {
                  await AuthService.firebase().logout().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, signInRoute, (route) => false));
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
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    this.onPressed,
    required this.leading,
    required this.identifier,
    required this.trailing,
  }) : super(key: key);
  final Widget leading;
  final String identifier;
  final Widget trailing;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.height / 1,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            leading,
            const SizedBox(
              width: 30,
            ),
            Text(
              identifier,
              style: textTheme.headline2,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: trailing,
            )
          ],
        ),
      ),
    );
  }
}
