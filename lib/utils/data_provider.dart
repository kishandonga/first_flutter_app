import 'dart:collection';

import 'package:flutter_app/utils/const.dart';

class DataProvider {
  static Map<String, String> getDashboardList() {
    final Map map = LinkedHashMap<String, String>();
    map[Const.HelloWorld] = "This is Hello World App";
    map[Const.ListView] = "This is showing list view";
    map[Const.ListViewCustom] = "This is sample";
    map[Const.GridView] = "This is sample";
    map[Const.DateTime] = "This is sample";
    map[Const.PullToRefresh] = "This is sample";
    map[Const.ProgressIndicator] = "This is sample";
    map[Const.ModalBottomSheet] = "This is sample";
    map[Const.TextFieldDemo] = "This is sample";
    map[Const.SQLite] = "This is sample";
    return map;
  }
}
