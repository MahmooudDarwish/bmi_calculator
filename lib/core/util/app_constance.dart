import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';

abstract class AppConstance {
  static List<BarItem> homeBottomNavBarItems = [
    BarItem(title: StringConstance.addBmi, icon: Icons.speed),
    BarItem(title: StringConstance.history, icon: Icons.history),
  ];


}
