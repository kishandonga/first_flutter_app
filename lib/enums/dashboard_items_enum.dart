enum DashboardItem {
  helloWorld(
    title: 'Hello World!',
    desc: 'hello world demo',
  ),
  listView1(
    title: 'List View 1',
    desc: 'list view demo',
  ),
  listView2(
    title: 'List View 2',
    desc: 'custom list view demo',
  ),
  gridView(
    title: 'Grid View',
    desc: 'this is sample',
  ),
  dateTimePicker(
    title: 'Date Time Picker',
    desc: 'this is sample',
  ),
  pullToRefresh(
    title: 'Pull to refresh',
    desc: 'this is sample',
  ),
  progressIndicators(
    title: 'Progress indicators',
    desc: 'this is sample',
  ),
  modalBottomSheet(
    title: 'Modal bottom sheet',
    desc: 'this is sample',
  ),
  textField(
    title: 'Text Field',
    desc: 'this is sample',
  ),
  sqLite(
    title: 'SQLite - sqflite',
    desc: 'this is sample',
  ),
  animatedOpacityWidget(
    title: 'Animated Opacity Widget',
    desc: 'this is sample',
  );

  final String title;
  final String desc;

  const DashboardItem({required this.title, required this.desc});
}
