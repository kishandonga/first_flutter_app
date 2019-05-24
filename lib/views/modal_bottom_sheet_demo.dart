import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class ModalBottomSheetDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text(Const.ModalBottomSheet)),
      body: new Center(
        child: new RaisedButton(
          child: const Text('SHOW BOTTOM SHEET'),
          onPressed: () {
            showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return new Container(
                child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text('This is the modal bottom sheet. Click anywhere to dismiss.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24.0
                    )
                  )
                )
              );
            });
          }
        )
      )
    );
  }
}
