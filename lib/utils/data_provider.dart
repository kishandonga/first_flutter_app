import 'package:first_flutter_app/utils/const.dart';

class DataProvider {
  static Map<String, String> getDashboardList() {
    final map = <String, String>{};
    map[Const.helloWorld] = "This is Hello World App";
    map[Const.listView] = "This is showing list view";
    map[Const.listViewCustom] = "This is sample";
    map[Const.gridView] = "This is sample";
    map[Const.dateTime] = "This is sample";
    map[Const.pullToRefresh] = "This is sample";
    map[Const.progressIndicator] = "This is sample";
    map[Const.modalBottomSheet] = "This is sample";
    map[Const.textFieldDemo] = "This is sample";
    map[Const.sqLite] = "This is sample";
    map[Const.animatedOpacityDemo] = "This is Animated Opacity Sample";
    return map;
  }
}
