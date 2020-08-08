import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPage createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  List<String> strings = List();

  void _addWeightSave() {
    setState(() {
      strings.add("string");
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
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
        title: const Text('When click on tile'),
        content: Text('You selected item => ' + value),
        actions: <Widget>[
          CupertinoDialogAction(
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
    return Scaffold(
      appBar: AppBar(
        title: Text(Const.ListView),
      ),
      body: ListView(
        children: strings.map((String string) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.insert_emoticon, size: 35.0),
                  title: Text(string),
                  onTap: () {
                    showCustomDialog(context, string);
                  },
                ),
                Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWeightSave,
        tooltip: 'Add  weight entry',
        child: Icon(Icons.add),
      ),
    );
  }
}
