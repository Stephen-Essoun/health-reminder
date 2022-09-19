import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/views/nav_but_view/fourth_view.dart';
import 'package:pillset/views/home_view.dart';
import 'package:pillset/views/nav_but_view/second_view.dart';
import 'package:pillset/views/nav_but_view/third_view.dart';

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
    OnTap onTap = OnTap();
    return ValueListenableBuilder(
       valueListenable: onTap,
      builder: (context,value,child) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            bottom: false,
            child: pages[value],
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 12,
            color: white,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
                 backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: green,
                unselectedItemColor: whiteGrey,
                currentIndex: value,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                onTap: (index) =>
                    onTap.whenTapped(index),
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
                  BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.fire), label: ''),
                  BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.chartSimple), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                ]),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: darkGrey,
            foregroundColor: white,
            child: const FaIcon(
              FontAwesomeIcons.plus,
              size: 35,
            ),
          ),
        );
      },
    );
  }
}

class OnTap extends ValueNotifier<int> {
  OnTap._sharedInference() : super(0);
  static final OnTap _shared = OnTap._sharedInference();
  factory OnTap() => _shared;
  void whenTapped(int index) {
    value = index;
    notifyListeners();
  }
}
