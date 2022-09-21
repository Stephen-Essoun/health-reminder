import 'package:flutter/material.dart';
import 'package:pillset/commons/components/appbar.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';

import '../../module/profile_model.dart';

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
            ...List.generate(
                pmodel.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.height/1,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            pmodel[index].leading,
                            const SizedBox(
                              width: 30,
                            ),
                            Text(pmodel[index].identifier,style: textTheme.headline2),
                            const Spacer(),
                            pmodel[index].trailing
                          ],
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
