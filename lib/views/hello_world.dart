import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Const.HelloWorld),
      ),
      body: Center(
        child: Text(Const.HelloWorld),
      ),
    );
  }
}
