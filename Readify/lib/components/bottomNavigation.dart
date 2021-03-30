import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({@required this.controller});

  final int controller;
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "", Color(0xff6D93FF),
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.book, "", Color(0xff6D93FF),
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.person, "", Color(0xff6D93FF)),
  ]);
  CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(0);
  @override
  Widget build(BuildContext context) {
    return CircularBottomNavigation(
      tabItems,
      selectedPos: controller,
      iconsSize: 40.0,
      barBackgroundColor: Colors.white70,
      circleSize: 80.0,
      barHeight: 71.0,
      selectedCallback: (int selectedPos) {
        print("clicked on $selectedPos");
        _navigationController.value = selectedPos;
      },
      controller: _navigationController,
    );
  }
}
