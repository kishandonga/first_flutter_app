import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Const.GridView),
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
              color: Colors.white30,
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: <String>[
                    'https://unsplash.it/300/500?image=1',
                    'https://unsplash.it/300/500?image=2',
                    'https://unsplash.it/300/500?image=3',
                    'https://unsplash.it/300/500?image=4',
                    'https://unsplash.it/300/500?image=5',
                    'https://unsplash.it/300/500?image=6',
                    'https://unsplash.it/300/500?image=7',
                    'https://unsplash.it/300/500?image=8',
                    'https://unsplash.it/300/500?image=9',
                    'https://unsplash.it/300/500?image=10',
                    'https://unsplash.it/300/500?image=11',
                    'https://unsplash.it/300/500?image=12',
                    'https://unsplash.it/300/500?image=13',
                    'https://unsplash.it/300/500?image=14',
                    'https://unsplash.it/300/500?image=15',
                    'https://unsplash.it/300/500?image=16',
                    'https://unsplash.it/300/500?image=17',
                  ].map((String url) {
                    return GridTile(
                        child: InkResponse(
                      enableFeedback: true,
                      child: Image.network(url, fit: BoxFit.cover),
                      onTap: () {
                        showInSnackBar(context, url);
                      },
                    ));
                  }).toList()));
        }));
  }

  void showInSnackBar(BuildContext context, String value) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
