
import 'package:flutter/material.dart';
import '../commons/utils/colors.dart';
import '../commons/utils/text_theme.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.images,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String images;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(images), fit: BoxFit.contain)),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: textTheme.headline1,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content,
                    style: textTheme.headline3,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
