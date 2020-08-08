import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class ModalBottomSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(Const.ModalBottomSheet)),
        body: Center(
            child: RaisedButton(
                child: const Text('SHOW BOTTOM SHEET'),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Text(
                                    'This is the modal bottom sheet. Click anywhere to dismiss.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 24.0))));
                      });
                })));
  }
}
