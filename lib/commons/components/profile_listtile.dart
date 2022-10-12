
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_theme.dart';

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
