import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  final String title;
  const ListViewPage(this.title, {Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  List<String> strings = [];

  void _addWeightSave() {
    setState(() {
      strings.add("string");
    });
  }

  void buildDialog(BuildContext context, Widget child) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => child,
    );
  }

  void showCustomDialog(BuildContext context, String value) {
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
        title: const Text('When click on tile'),
        content: Text('You selected item => $value'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ]);

    buildDialog(context, dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: strings.map((String string) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.insert_emoticon, size: 35.0),
                  title: Text(string),
                  onTap: () {
                    showCustomDialog(context, string);
                  },
                ),
                const Divider(
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
