import 'package:flutter/material.dart';
import 'package:pillset/commons/components/appbar.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/database/user_detailed.dart';
import 'package:pillset/views/nav_but_view/tile_view_for_fourth_page.dart';

import '../registeration_view/register_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = '___';

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    try {
      final user = await UDBase().readUserInfo();
      setState(() {
        userName =
            user?['name'] ?? 'empty'; // Update the userName state variable
      });
    } catch (error) {
      print('Error fetching user info: $error');
    }
  }

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
                        //taking name from the sign up page
                        userName,
                        style: textTheme.headline1!.copyWith(fontSize: 20),
                      ),
                      Text('A lot of words these days',
                          style: textTheme.headline2),
                    ],
                  )
                ],
              ),
            ),
            const TileView()
          ],
        ),
      ),
    );
  }
}
