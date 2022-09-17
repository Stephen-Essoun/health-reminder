import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/text_theme.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../commons/components/appbar.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const ApBar(title: 'Your plan',),
      body: Center(child: TableCalendar(
  firstDay: DateTime.utc(2010, 10, 16),
  lastDay: DateTime.utc(2030, 3, 14),
  focusedDay: DateTime.now(),
  headerVisible: false,
)),
    );
  }
}
