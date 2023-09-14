import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  final String title;
  const GridViewPage(this.title, {Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final urlList = [
    'https://fastly.picsum.photos/id/1/300/500.jpg?hmac=epoeovDmjxJxovKGh8ZpDV7a5kDcGAc3kD24NoHwF2U',
    'https://fastly.picsum.photos/id/2/300/500.jpg?hmac=ZRQfkYTKTnVv2wPTHcOpQZplsoxFt-4XRGSCCPEeeSA',
    'https://fastly.picsum.photos/id/3/300/500.jpg?hmac=sr0ttoWHbWWOJgFbJRBNDmDUucsjyKqvCWGC3FtXTSs',
    'https://fastly.picsum.photos/id/1/300/500.jpg?hmac=epoeovDmjxJxovKGh8ZpDV7a5kDcGAc3kD24NoHwF2U',
    'https://fastly.picsum.photos/id/2/300/500.jpg?hmac=ZRQfkYTKTnVv2wPTHcOpQZplsoxFt-4XRGSCCPEeeSA',
    'https://fastly.picsum.photos/id/3/300/500.jpg?hmac=sr0ttoWHbWWOJgFbJRBNDmDUucsjyKqvCWGC3FtXTSs',
    'https://fastly.picsum.photos/id/1/300/500.jpg?hmac=epoeovDmjxJxovKGh8ZpDV7a5kDcGAc3kD24NoHwF2U',
    'https://fastly.picsum.photos/id/2/300/500.jpg?hmac=ZRQfkYTKTnVv2wPTHcOpQZplsoxFt-4XRGSCCPEeeSA',
    'https://fastly.picsum.photos/id/3/300/500.jpg?hmac=sr0ttoWHbWWOJgFbJRBNDmDUucsjyKqvCWGC3FtXTSs',
    'https://fastly.picsum.photos/id/1/300/500.jpg?hmac=epoeovDmjxJxovKGh8ZpDV7a5kDcGAc3kD24NoHwF2U',
    'https://fastly.picsum.photos/id/2/300/500.jpg?hmac=ZRQfkYTKTnVv2wPTHcOpQZplsoxFt-4XRGSCCPEeeSA',
    'https://fastly.picsum.photos/id/3/300/500.jpg?hmac=sr0ttoWHbWWOJgFbJRBNDmDUucsjyKqvCWGC3FtXTSs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: [
          ...urlList.map(
            (e) => GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(e, fit: BoxFit.cover),
                onTap: () {
                  showInSnackBar(context, e);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
