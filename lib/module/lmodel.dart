//this is a model that feeds the cards in the homepage

import 'package:flutter/material.dart';

import '../commons/utils/colors.dart';
import 'container_module.dart';

class LModel {
  String leading;
  String title;
  String subtitle;
  Widget trailing;
  LModel(
      {required this.leading,
      required this.title,
      required this.subtitle,
      required this.trailing});
}

List lmodel = [
  LModel(
      leading: 'images/cinupret.png',
      title: 'Cinupret',
      subtitle: '2 pills',
      trailing: Row(
        children: [
          ...List.generate(
            cmodel.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Container(
                height: 6,
                width: 6,
                decoration: const BoxDecoration(
                  color: green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      )),
  LModel(
      leading: 'images/centrum.png',
      title: 'Centrum',
      subtitle: '4 pills',
      trailing: Row(
        children: [
          ...List.generate(
            cmodel.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Container(
                height: 6,
                width: 6,
                decoration: const BoxDecoration(
                  color: green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      )),
  LModel(
      leading: 'images/intimate.png',
      title: 'Intimate',
      subtitle: '3 pills',
      trailing: Row(
        children: [
          ...List.generate(
            cmodel.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Container(
                height: 6,
                width: 6,
                decoration: const BoxDecoration(
                  color: green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      )),
  LModel(
      leading: 'images/amlokard.png',
      title: 'Amlokard',
      subtitle: '2 pills',
      trailing: Expanded(
        child: Row(
          children: [
            ...List.generate(
              cmodel.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Container(
                  height: 6,
                  width: 6,
                  decoration: const BoxDecoration(
                    color: green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
];
