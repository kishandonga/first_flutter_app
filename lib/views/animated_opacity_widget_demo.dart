import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class AnimatedOpacityWidgetDemo extends StatefulWidget {
  const AnimatedOpacityWidgetDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimatedOpacityWidgetDemoState();
  }
}

class _AnimatedOpacityWidgetDemoState extends State<AnimatedOpacityWidgetDemo> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Const.animatedOpacityDemo)),
      body: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: _toggle,
              child: const Text("WELCOME"),
            ),
          ),
          IgnorePointer(
            ignoring: !loading,
            child: AnimatedOpacity(
              opacity: loading ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: GestureDetector(
                      onTap: _toggle,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _toggle() {
    setState(() {
      loading = !loading;
    });
  }
}
