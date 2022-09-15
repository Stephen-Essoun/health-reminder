import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/views/nav_view/fourth_view.dart';
import 'package:pillset/views/nav_view/home_view.dart';
import 'package:pillset/views/nav_view/second_view.dart';
import 'package:pillset/views/nav_view/third_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> pages = const [
    HomeView(),
    HealthView(),
    StatisticsView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
        bottomNavigationBar: BottomAppBar(
      child: BottomNavigationBar(
        selectedItemColor: green,
        unselectedItemColor: darkGrey,
        onTap: ((index) {
          setState(() {
          index = currentIndex;
            
          });
        }),
        items:const [
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined), label: ''),
      ]),
    ));
  }
}
