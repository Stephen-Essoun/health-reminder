import 'package:flutter/material.dart';
import 'package:pillset/commons/components/appbar.dart';
import '../../commons/utils/colors.dart';
import '../../commons/utils/text_theme.dart';
import '../../module/container_module.dart';

class HealthView extends StatelessWidget {
  const HealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ApBar(title: 'Health Monitoring'),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: cmodel.length,
            itemBuilder: (ctx, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: MediaQuery.of(context).size.height / 7,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cmodel[index].heading,
                            style: textTheme.headline2,
                          ),
                          RichText(text: cmodel[index].widget),
                          Text(
                            cmodel[index].ending,
                            style: const TextStyle(color: whiteGrey),
                          )
                        ],
                      ),
                     const Spacer(),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(cmodel[index].image),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
