import 'package:first_flutter_app/utils/const.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityWidgetDemo extends StatefulWidget {
  const AnimatedOpacityWidgetDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedOpacityWidgetDemoState();
}

class _AnimatedOpacityWidgetDemoState extends State<AnimatedOpacityWidgetDemo> {
  bool opacityLevel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Const.animatedOpacityDemo),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tap on the below button',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ElevatedButton(
            onPressed: _toggle,
            child: const Text('Click'),
          ),
          Expanded(
            child: Center(
              child: AnimatedOpacity(
                opacity: opacityLevel ? 0 : 1,
                duration: const Duration(seconds: 3),
                child: const FlutterLogo(
                  size: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _toggle() {
    setState(() {
      opacityLevel = !opacityLevel;
    });
  }
}
