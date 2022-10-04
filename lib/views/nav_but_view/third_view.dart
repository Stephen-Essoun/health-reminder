import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pillset/commons/components/appbar.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Clicked clicked = Clicked();
    return Scaffold(
      extendBody: true,
      appBar: const ApBar(title: 'Statistics'),
      body: ValueListenableBuilder(
        valueListenable: clicked,
        builder: (ctx, stateOfContainer, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => clicked.isClicked(true),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: stateOfContainer ? green : white,
                    ),
                    child: Center(
                      child: Text(
                        'Active',
                        style: textTheme.headline1!.copyWith(
                            fontSize: 20,
                            color: stateOfContainer ? white : darkGrey),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => clicked.isClicked(false),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: stateOfContainer ? white : green,
                    ),
                    child: Center(
                      child: Text(
                        'Completed',
                        style: textTheme.headline1!.copyWith(
                          fontSize: 20,
                          color: stateOfContainer ? darkGrey : white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ///////////////////
            Expanded(
              child: SafeArea(
                minimum:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                bottom: false,
                child: stateOfContainer
                    ? GridView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 180),
                        itemBuilder: (ctx, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/cinupret.png'),
                                      backgroundColor: Colors.transparent,
                                      radius: 25,
                                    ),
                                    Text(
                                      'Drug Name',
                                      style: textTheme.headline1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    Text(
                                      'Duration',
                                      style: textTheme.headline2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        animation: true,
                                        lineHeight: 30.0,
                                        animationDuration: 2000,
                                        percent: percent[index],
                                        barRadius: const Radius.circular(10),
                                        progressColor: green,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                    : ListView(
                        children: const [
                          SizedBox(
                            height: 200,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'No complete medication recognised',
                            ),
                          ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<double> percent = [
  .2,
  .4,
  .6,
  .1,
  .7,
  .3,
  .5,
  .8,
  .05,
  .4,
  .1,
  .8,
  .8,
  .3,
  .8,
  .6,
  .5,
  .8,
  .8,
  .9,
];

class Clicked extends ValueNotifier<bool> {
  Clicked._sharedInference() : super(true);
  static final Clicked _shared = Clicked._sharedInference();
  factory Clicked() => _shared;
  void isClicked(bool clicked) {
    value = clicked;
    notifyListeners();
  }
}
