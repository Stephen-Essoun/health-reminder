import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/text_theme.dart';

///this model is passed to the gridview containers in the home page and the tiles in the second page.
///
///
class CModel {
  String heading;
  String image;
  dynamic widget;
  String ending;
  CModel(
      {required this.heading,
      required this.image,
      required this.widget,
      required this.ending});
}

List cmodel = [
  CModel(
      heading: 'SATURATION',
      image: 'images/blood.png',
      widget: TextSpan(
        text: '99',
        style: textTheme.headline4,
        children: [
          TextSpan(text: '  %', style: textTheme.headline2),
        ],
      ),
      ending: 'Last update 5h'),
  CModel(
      heading: 'HEARTRATE',
      image: 'images/heartrate.png',
      widget: TextSpan(
        text: '91',
        style: textTheme.headline4,
        children: [
          TextSpan(text: '  bpm', style: textTheme.headline2),
        ],
      ),
      ending: 'Last update 5h'),
  CModel(
      heading: 'PRESSURE',
      image: 'images/pressure.png',
      widget: TextSpan(
        text: '120/80',
        style: textTheme.headline4,
        children: [
          TextSpan(text: '  mmHg', style: textTheme.headline2),
        ],
      ),
      ending: 'Last update 5h'),
  CModel(
      heading: 'TEMPERATURE',
      image: 'images/temperature.png',
      widget: TextSpan(
        text: '37.8',
        style: textTheme.headline4!.copyWith(color: Colors.yellow),
        children: [
          TextSpan(
              text: '  o',
              style: textTheme.headline2,
              children: const [TextSpan(text: 'C')]),
        ],
      ),
      ending: 'Last update 5h')
];
