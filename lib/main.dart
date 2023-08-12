import 'package:first_flutter_app/utils/const.dart';
import 'package:first_flutter_app/views/dashboard_view.dart';
import 'package:first_flutter_app/views/sqlite/helper/database_client.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseClient.instance.init();

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
