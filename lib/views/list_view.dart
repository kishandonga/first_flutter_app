import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPage createState() => new _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  List<String> strings = new List();

  void _addWeightSave() {
    setState(() {
      strings.add("new string");
    });
  }

  void buildDialog({BuildContext context, Widget child}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => child,
    );
  }

  void showCustomDialog(BuildContext context, String value) {
    CupertinoAlertDialog dialog = new CupertinoAlertDialog(
        title: const Text('When click on tile'),
        content: new Text('You selected item => ' + value),
        actions: <Widget>[
          new CupertinoDialogAction(
              child: const Text('OK'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'OK');
              }),
        ]);

    buildDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Const.ListView),
      ),
      body: new ListView(
        children: strings.map((String string) {
          return new Padding(
            padding: new EdgeInsets.all(5.0),
            child: new Column(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.insert_emoticon, size: 35.0),
                  title: new Text(string),
                  onTap: () {
                    showCustomDialog(context, string);
                  },
                ),
                new Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            ),
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addWeightSave,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
    );
  }
}
