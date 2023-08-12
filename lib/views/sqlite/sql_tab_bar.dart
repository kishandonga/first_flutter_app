import 'package:first_flutter_app/utils/const.dart';
import 'package:first_flutter_app/views/sqlite/pages/sql_delete_data.dart';
import 'package:first_flutter_app/views/sqlite/pages/sql_insert_data.dart';
import 'package:first_flutter_app/views/sqlite/pages/sql_update_data.dart';
import 'package:first_flutter_app/views/sqlite/pages/sql_view_data.dart';
import 'package:flutter/material.dart';

class SQLiteDemo extends StatelessWidget {
  const SQLiteDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: Const.sqlView),
              Tab(text: Const.sqlInsert),
              Tab(text: Const.dqlUpdate),
              Tab(text: Const.sqlDelete),
            ],
          ),
          title: const Text(Const.sqLite),
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
