import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/dashboard_view.dart';

void main() {
  runApp(MaterialApp(
    title: Const.appName,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.red, // Your accent color
      ),
    ),
    home: const DashboardPage(),
  ));
}
