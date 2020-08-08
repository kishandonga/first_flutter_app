import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/utils/data_provider.dart';
import 'package:flutter_app/views/progress_indicator_demo.dart';
import 'package:flutter_app/views/pull_to_refresh_demo.dart';
import 'package:flutter_app/views/sqlite/sql_tab_bar.dart';
import 'package:flutter_app/views/text_field_demo.dart';

import 'date_time_picker.dart';
import 'grid_view.dart';
import 'hello_world.dart';
import 'list_view.dart';
import 'list_view_custom.dart';
import 'modal_bottom_sheet_demo.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  final Map items = DataProvider.getDashboardList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Const.AppName)),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          var key = items.keys.elementAt(index);
          var value = items.values.elementAt(index);
          return Material(
            child: ListTile(
              title: Text(key),
              subtitle: Text(value),
              onTap: () => navigateTo(context, key),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: Const.OpenDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  navigateTo(BuildContext context, key) {
    var pageRoute;
    switch (key.toString()) {
      case Const.HelloWorld:
        pageRoute = MaterialPageRoute(builder: (context) => HelloWorld());
        break;
      case Const.ListView:
        pageRoute = MaterialPageRoute(builder: (context) => ListViewPage());
        break;
      case Const.ListViewCustom:
        pageRoute =
            MaterialPageRoute(builder: (context) => CategoryStatePage());
        break;
      case Const.GridView:
        pageRoute = MaterialPageRoute(builder: (context) => GridViewPage());
        break;
      case Const.DateTime:
        pageRoute =
            MaterialPageRoute(builder: (context) => DateAndTimePickerDemo());
        break;
      case Const.PullToRefresh:
        pageRoute =
            MaterialPageRoute(builder: (context) => PullToRefreshDemo());
        break;
      case Const.ProgressIndicator:
        pageRoute =
            MaterialPageRoute(builder: (context) => ProgressIndicatorDemo());
        break;
      case Const.ModalBottomSheet:
        pageRoute =
            MaterialPageRoute(builder: (context) => ModalBottomSheetDemo());
        break;
      case Const.TextFieldDemo:
        pageRoute =
            MaterialPageRoute(builder: (context) => TextFormFieldDemo());
        break;
      case Const.SQLite:
        pageRoute = MaterialPageRoute(builder: (context) => SQLiteDemo());
        break;
    }
    if (pageRoute != null) {
      Navigator.push(context, pageRoute);
    }
  }
}
