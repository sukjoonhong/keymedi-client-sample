import 'package:flutter/material.dart';

class NavigationItem {
  final String label;
  final IconData icon;
  final Widget screen;
  final bool showAppBar;

  const NavigationItem({
    required this.label,
    required this.icon,
    required this.screen,
    required this.showAppBar,
  });
}