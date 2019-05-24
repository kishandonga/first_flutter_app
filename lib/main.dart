import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/date_time_picker.dart';
import 'package:flutter_app/views/grid_view.dart';
import 'package:flutter_app/views/hello_world.dart';
import 'package:flutter_app/views/list_view.dart';
import 'package:flutter_app/views/list_view_custom.dart';
import 'package:flutter_app/views/modal_bottom_sheet_demo.dart';
import 'package:flutter_app/views/overscroll_demo.dart';
import 'package:flutter_app/views/progress_indicator_demo.dart';
import 'package:flutter_app/views/sqlite/sql_tab_bar.dart';
import 'package:flutter_app/views/text_field_demo.dart';

void main() {
  runApp(new MaterialApp(
    title: Const.AppName,
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(Const.AppName)),
      body: new SingleChildScrollView(
        child: new Padding(
            padding: new EdgeInsets.all(16.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.HelloWorld),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => new HelloWorld(),
                                  ));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.ListView),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => new ListViewPage(),
                                  ));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.ListViewCustom),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) =>
                                        new CategoryStatePage(),
                                  ));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.GridView),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => new GridViewPage(),
                                  ));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.DateTime),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new DateAndTimePickerDemo()));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.PullToRefresh),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new OverscrollDemo()));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.ProgressIndicator),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new ProgressIndicatorDemo()));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.ModalBottomSheet),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new ModalBottomSheetDemo()));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.TextFieldDemo),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                      new TextFormFieldDemo()));
                            })
                      ],
                    )),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text(Const.SQLite),
                            onPressed: () {
                              // Navigate to second screen when tapped!
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => new SQLiteDemo(),
                                  ));
                            })
                      ],
                    ))
              ],
            ))
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: Const.OpenDialog,
        child: new Icon(Icons.add),
      ),
    );
  }
}
