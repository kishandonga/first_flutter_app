import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/pages/sql_delete_data.dart';
import 'package:flutter_app/views/sqlite/pages/sql_insert_data.dart';
import 'package:flutter_app/views/sqlite/pages/sql_update_data.dart';
import 'package:flutter_app/views/sqlite/pages/sql_view_data.dart';

class SQLiteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: Const.SQLView),
              Tab(text: Const.SQLInsert),
              Tab(text: Const.SQLUpdate),
              Tab(text: Const.SQLDelete),
            ],
          ),
          title: Text(Const.SQLite),
        ),
        body: TabBarView(
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
