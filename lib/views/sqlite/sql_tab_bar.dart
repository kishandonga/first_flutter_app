import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/pages/sql_delete_data.dart';
import 'package:flutter_app/views/sqlite/pages/sql_insert_data.dart';
import 'package:flutter_app/views/sqlite/pages/sql_update_data.dart';
import 'package:flutter_app/views/sqlite/pages/sql_view_data.dart';

class SQLiteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            tabs: [
              new Tab(text: Const.SQLView),
              new Tab(text: Const.SQLInsert),
              new Tab(text: Const.SQLUpdate),
              new Tab(text: Const.SQLDelete),
            ],
          ),
          title: new Text(Const.SQLite),
        ),
        body: new TabBarView(
          children: [
            new ViewStudentData(),
            new InsertData(),
            new UpdateData(),
            new DeleteData(),
          ],
        ),
      ),
    );
  }
}