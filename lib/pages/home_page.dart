import 'package:first_flutter_app/enums/dashboard_items_enum.dart';
import 'package:first_flutter_app/pages/animated_opacity_widget_demo.dart';
import 'package:first_flutter_app/pages/progress_indicator_demo.dart';
import 'package:first_flutter_app/pages/pull_to_refresh_demo.dart';
import 'package:first_flutter_app/pages/sqlite/sql_tab_bar.dart';
import 'package:first_flutter_app/pages/text_field_demo.dart';
import 'package:flutter/material.dart';

import 'date_time_picker.dart';
import 'grid_view.dart';
import 'hello_world.dart';
import 'list_view.dart';
import 'list_view_custom.dart';
import 'modal_bottom_sheet_demo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final items = DashboardItem.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo App')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          final model = items[index];
          return Material(
            child: ListTile(
              title: Text(model.title),
              subtitle: Text(model.desc),
              onTap: () => navigateTo(context, model),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Open Dialog',
        child: const Icon(Icons.add),
      ),
    );
  }

  navigateTo(BuildContext context, DashboardItem item) {
    MaterialPageRoute? pageRoute;
    switch (item) {
      case DashboardItem.helloWorld:
        pageRoute =
            MaterialPageRoute(builder: (context) => HelloWorld(item.title));
        break;
      case DashboardItem.listView1:
        pageRoute =
            MaterialPageRoute(builder: (context) => ListViewPage(item.title));
        break;
      case DashboardItem.listView2:
        pageRoute = MaterialPageRoute(
            builder: (context) => CategoryStatePage(item.title));
        break;
      case DashboardItem.gridView:
        pageRoute =
            MaterialPageRoute(builder: (context) => GridViewPage(item.title));
        break;
      case DashboardItem.dateTimePicker:
        pageRoute = MaterialPageRoute(
            builder: (context) => const DateAndTimePickerDemo());
        break;
      case DashboardItem.pullToRefresh:
        pageRoute = MaterialPageRoute(
            builder: (context) => PullToRefreshDemo(item.title));
        break;
      case DashboardItem.progressIndicators:
        pageRoute = MaterialPageRoute(
            builder: (context) => ProgressIndicatorDemo(item.title));
        break;
      case DashboardItem.modalBottomSheet:
        pageRoute = MaterialPageRoute(
            builder: (context) => ModalBottomSheetDemo(item.title));
        break;
      case DashboardItem.textField:
        pageRoute = MaterialPageRoute(
            builder: (context) => TextFormFieldDemo(item.title));
        break;
      case DashboardItem.sqLite:
        pageRoute =
            MaterialPageRoute(builder: (context) => SQLiteDemo(item.title));
        break;
      case DashboardItem.animatedOpacityWidget:
        pageRoute = MaterialPageRoute(
            builder: (context) => AnimatedOpacityWidgetDemo(item.title));
        break;
    }
    Navigator.push(context, pageRoute);
  }
}
