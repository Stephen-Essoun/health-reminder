import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:pillset/module/container_module.dart';
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: cmodel.length,
                  itemBuilder: (ctx, index) => Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: gridColumn(index),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) =>   ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('images/heart.png'),
                    ),
                    title: const Text('Medicine'),
                    subtitle:const Text('number of pills'),
                    trailing:Column(children: [...List.generate(cmodel.length, (index) => Container(height: 12,width: 6,))],) ,
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            cmodel[index].heading,
            style: textTheme.headline2,
          ),
        ),
        Container(
          height: 40,
          width: 10,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cmodel[index].image),
            ),
          ),
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(text: cmodel[index].widget))),
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
