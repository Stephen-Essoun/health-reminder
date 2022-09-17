
import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/text_theme.dart';

import '../utils/colors.dart';

class ApBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget? trialing;
  const ApBar({
    Key? key, required this.title, this.trialing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      foregroundColor: whiteGrey,
      title: Text(title,style: textTheme.headline1,),
    );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}