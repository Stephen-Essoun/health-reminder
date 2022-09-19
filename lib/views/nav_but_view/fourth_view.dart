import 'package:flutter/material.dart';
import 'package:pillset/commons/components/appbar.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                      backgroundImage: AssetImage('images/heart.png'),
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
                      Text('Subtitle', style: textTheme.headline4!.copyWith(color: darkGrey))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
