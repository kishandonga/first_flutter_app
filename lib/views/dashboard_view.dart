import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/utils/data_provider.dart';
import 'package:flutter_app/views/animated_opacity_widget_demo.dart';
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
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  final Map items = DataProvider.getDashboardList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Const.appName)),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
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
        tooltip: Const.openDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  navigateTo(BuildContext context, key) {
    MaterialPageRoute? pageRoute;
    switch (key.toString()) {
      case Const.helloWorld:
        pageRoute = MaterialPageRoute(builder: (context) => const HelloWorld());
        break;
      case Const.listView:
        pageRoute =
            MaterialPageRoute(builder: (context) => const ListViewPage());
        break;
      case Const.listViewCustom:
        pageRoute =
            MaterialPageRoute(builder: (context) => const CategoryStatePage());
        break;
      case Const.gridView:
        pageRoute =
            MaterialPageRoute(builder: (context) => const GridViewPage());
        break;
      case Const.dateTime:
        pageRoute = MaterialPageRoute(
            builder: (context) => const DateAndTimePickerDemo());
        break;
      case Const.pullToRefresh:
        pageRoute =
            MaterialPageRoute(builder: (context) => const PullToRefreshDemo());
        break;
      case Const.progressIndicator:
        pageRoute = MaterialPageRoute(
            builder: (context) => const ProgressIndicatorDemo());
        break;
      case Const.modalBottomSheet:
        pageRoute = MaterialPageRoute(
            builder: (context) => const ModalBottomSheetDemo());
        break;
      case Const.textFieldDemo:
        pageRoute =
            MaterialPageRoute(builder: (context) => const TextFormFieldDemo());
        break;
      case Const.sqLite:
        pageRoute = MaterialPageRoute(builder: (context) => const SQLiteDemo());
        break;
      case Const.animatedOpacityDemo:
        pageRoute = MaterialPageRoute(
            builder: (context) => const AnimatedOpacityWidgetDemo());
        break;
    }
    if (pageRoute != null) {
      Navigator.push(context, pageRoute);
    }
  }
}
