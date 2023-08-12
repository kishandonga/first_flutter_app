import 'package:first_flutter_app/utils/const.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(Const.modalBottomSheet)),
        body: Center(
            child: ElevatedButton(
                child: const Text('SHOW BOTTOM SHEET'),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(
                            'This is the modal bottom sheet. Click anywhere to dismiss.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 24.0),
                          ),
                        );
                      });
                })));
  }
}
