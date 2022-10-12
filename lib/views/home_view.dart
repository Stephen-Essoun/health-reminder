import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/module/container_module.dart';
import 'package:pillset/module/lmodel.dart';
import 'package:table_calendar/table_calendar.dart';
import '../commons/components/appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CalendarFormat _format = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApBar(
        title: 'Your plan',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              calender(),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 150),
                itemCount: cmodel.length,
                itemBuilder: (ctx, index) => Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: gridColumn(index),
                  ),
                ),
              ),
              //end of gridview
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cmodel.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Container(
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 80,
                      child: Row(
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(lmodel[index].leading),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lmodel[index].title,
                                  style: textTheme.headline1!
                                      .copyWith(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Text(lmodel[index].subtitle),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: lmodel[index].trailing)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// This medthod is built by the above grid view
  Column gridColumn(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            cmodel[index].heading,
            style: textTheme.headline2,
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(cmodel[index].image),
            )),
        Align(
          alignment: Alignment.bottomLeft,
          child: RichText(text: cmodel[index].widget),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            cmodel[index].ending,
            style: const TextStyle(color: whiteGrey),
          ),
        )
      ],
    );
  }

  ///calender
  TableCalendar<dynamic> calender() {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      headerVisible: false,
      calendarFormat: _format,
      pageJumpingEnabled: true,
      calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
        color: green,
        shape: BoxShape.circle,
      )),
      onFormatChanged: (format) {
        setState(() {
          format = _format;
        });
      },
    );
  }
}
