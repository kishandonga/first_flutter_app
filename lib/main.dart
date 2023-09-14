import 'package:first_flutter_app/pages/home_page.dart';
import 'package:first_flutter_app/pages/sqlite/helper/database_client.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseClient.instance.init();

  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.red,
      ),
    ),
    home: const HomePage(),
  ));
}
