import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Const.helloWorld),
      ),
      body: const Center(
        child: Text(Const.helloWorld),
      ),
    );
  }
}
