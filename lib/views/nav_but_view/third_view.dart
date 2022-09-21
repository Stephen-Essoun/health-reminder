import 'package:flutter/material.dart';
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
      body: ListView(
        
        children: 
          [ValueListenableBuilder(
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
                            'Activate',
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
                SingleChildScrollView(
                  child: SafeArea(
                    minimum: const EdgeInsets.symmetric(horizontal: 10),
                    top: false,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 180),
                      itemBuilder: (ctx, index) => stateOfContainer
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10)),
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
                                      'Anthing is coming',
                                      style: textTheme.headline1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    Text(
                                      'Anthing is coming',
                                      style: textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  color: darkGrey,
                                  height: MediaQuery.of(context).size.height,
                                  child: const Center(
                                      child: Text('I am empty for now'))),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Clicked extends ValueNotifier<bool> {
  Clicked._sharedInference() : super(true);
  static final Clicked _shared = Clicked._sharedInference();
  factory Clicked() => _shared;
  void isClicked(bool clicked) {
    value = clicked;
    notifyListeners();
  }
}
