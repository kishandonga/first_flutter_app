import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class PullToRefreshDemo extends StatefulWidget {
  const PullToRefreshDemo({Key? key}) : super(key: key);

  @override
  PullToRefreshDemoState createState() => PullToRefreshDemoState();
}

class PullToRefreshDemoState extends State<PullToRefreshDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  static final List<String> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete(null);
    });
    return completer.future.then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState?.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Const.pullToRefresh), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              _refreshIndicatorKey.currentState?.show();
            }),
      ]),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView.builder(
          padding: kMaterialListPadding,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            final String item = _items[index];
            return ListTile(
              isThreeLine: true,
              leading: CircleAvatar(child: Text(item)),
              title: Text('This item represents $item.'),
              subtitle: const Text(
                  'Even more additional list item information appears on line three.'),
            );
          },
        ),
      ),
    );
  }
}
