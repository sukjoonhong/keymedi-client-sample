import 'package:flutter/material.dart';
import 'package:keymedi_client/constants/numbers.dart';

import '../navigation/navigation_items.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    final currentItem = navigationItems[_currentIndex];

    return Scaffold(
      appBar: currentItem.showAppBar
          ? AppBar(
              title: Text(currentItem.label),
              centerTitle: true,
            )
          : null,
      body: currentItem.screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: navigationItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
