import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Const.HelloWorld),
      ),
      body: new Center(
        child: new Text(Const.HelloWorld),
      ),
    );
  }
}
