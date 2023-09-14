import 'package:first_flutter_app/pages/sqlite/pages/sql_delete_data.dart';
import 'package:first_flutter_app/pages/sqlite/pages/sql_insert_data.dart';
import 'package:first_flutter_app/pages/sqlite/pages/sql_update_data.dart';
import 'package:first_flutter_app/pages/sqlite/pages/sql_view_data.dart';
import 'package:flutter/material.dart';

class SQLiteDemo extends StatelessWidget {
  final String title;
  const SQLiteDemo(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'View'),
              Tab(text: 'Insert'),
              Tab(text: 'Update'),
              Tab(text: 'Delete'),
            ],
          ),
          title: Text(title),
        ),
        body: const TabBarView(
          children: [
            ViewStudentData(),
            InsertData(),
            UpdateData(),
            DeleteData(),
          ],
        ),
      ),
    );
  }
}
