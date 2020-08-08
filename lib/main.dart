import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/dashboard_view.dart';

void main() {
  runApp(MaterialApp(
    title: Const.AppName,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: DashboardPage(),
  ));
}
