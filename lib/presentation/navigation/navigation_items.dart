

import 'package:flutter/material.dart';
import 'package:keymedi_client/presentation/screens/client_screen.dart';
import 'package:keymedi_client/presentation/screens/community_screen.dart';
import 'package:keymedi_client/presentation/screens/home_screen.dart';
import 'package:keymedi_client/presentation/screens/performance_screen.dart';
import 'package:keymedi_client/presentation/screens/report_screen.dart';

import 'navigation_item.dart';

final List<NavigationItem> navigationItems = [
  const NavigationItem(
    label: BottomNavigationLabels.clientLabel,
    icon: Icons.local_hospital_outlined,
    screen: ClientScreen(title: BottomNavigationLabels.clientLabel),
    showAppBar: false,
  ),
  const NavigationItem(
    label: BottomNavigationLabels.performanceLabel,
    icon: Icons.edit_note,
    screen: PerformanceScreen(title: BottomNavigationLabels.performanceLabel),
    showAppBar: false,
  ),
  const NavigationItem(
    label: BottomNavigationLabels.homeLabel,
    icon: Icons.home,
    screen: HomeScreen(title: BottomNavigationLabels.homeLabel),
    showAppBar: true,
  ),
  const NavigationItem(
    label: BottomNavigationLabels.reportLabel,
    icon: Icons.request_quote,
    screen: ReportScreen(title: BottomNavigationLabels.reportLabel),
    showAppBar: false,
  ),
  const NavigationItem(
    label: BottomNavigationLabels.communityLabel,
    icon: Icons.groups,
    screen: CommunityScreen(title: BottomNavigationLabels.communityLabel),
    showAppBar: false,
  ),
];


class BottomNavigationLabels {
  static const String clientLabel = '거래선';
  static const String performanceLabel = '실적입력';
  static const String homeLabel = 'HOME';
  static const String reportLabel = '지출보고';
  static const String communityLabel = '커뮤니티';
}
