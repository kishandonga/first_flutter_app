import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class CategoryStatePage extends StatefulWidget {
  @override
  CategoryPageState createState() => new CategoryPageState();
}

class CategoryPageState extends State<CategoryStatePage> {
  List<Widget> listCategories = [];
  List<ItemModel> list = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      list.add(new ItemModel(0, 'foo00'));
      list.add(new ItemModel(1, 'foo01'));
      list.add(new ItemModel(2, 'foo02'));
      list.add(new ItemModel(3, 'foo03'));
      list.add(new ItemModel(4, 'foo04'));
      list.add(new ItemModel(5, 'foo05'));
      list.add(new ItemModel(6, 'foo06'));
      list.add(new ItemModel(7, 'foo07'));
      list.add(new ItemModel(8, 'foo08'));
      list.add(new ItemModel(9, 'foo09'));
      list.add(new ItemModel(10, 'foo10'));
      list.add(new ItemModel(11, 'foo11'));
      list.add(new ItemModel(12, 'foo12'));
      list.add(new ItemModel(13, 'foo13'));
      list.add(new ItemModel(14, 'foo14'));
      list.add(new ItemModel(15, 'foo15'));
      list.add(new ItemModel(16, 'foo16'));
      list.add(new ItemModel(17, 'foo17'));
      list.add(new ItemModel(18, 'foo18'));
      list.add(new ItemModel(19, 'foo19'));
      list.add(new ItemModel(20, 'foo20'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(Const.ListView)),
        body: new ListView(
            padding: new EdgeInsets.only(top: 8.0, right: 0.0, left: 0.0),
            children: buildListCategories(this.list)));
  }

  List<Widget> buildListCategories(List<ItemModel> list) {
    listCategories = [];

    for (var im in list) {
      var id = im.id;
      var category = im.category;

      listCategories.add(new ItemCategory(
          key: new ObjectKey(id),
          id: id,
          category: category,
          onPressed: () async {
            setState(() {
              int id = this.list.indexOf(im);
              this.list.removeAt(id);
            });
          }));
    }
    return listCategories;
  }
}

class ItemModel {
  int id;
  String category;

  ItemModel(this.id, this.category);
}

class ItemCategory extends StatefulWidget {
  final int id;
  final String category;
  final VoidCallback onPressed;

  ItemCategory({Key key, this.id, this.category, this.onPressed})
      : super(key: key);

  @override
  ItemCategoryState createState() => new ItemCategoryState();
}

class ItemCategoryState extends State<ItemCategory>
    with TickerProviderStateMixin {
  ItemCategoryState();

  AnimationController _controller;
  Animation<double> _animation;
  double flingOpening;
  bool startFling = true;

  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 246), vsync: this);
    _animation = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );
  }

  void _move(DragUpdateDetails details) {
    final double delta = details.primaryDelta / 304;
    _controller.value -= delta;
  }

  void _settle(DragEndDetails details) {
    if (this.startFling) {
      _controller.fling(velocity: 1.0);
      this.startFling = false;
    } else if (!this.startFling) {
      _controller.fling(velocity: -1.0);
      this.startFling = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    this.flingOpening = -(48.0 / _width);

    return new GestureDetector(
        onHorizontalDragUpdate: _move,
        onHorizontalDragEnd: _settle,
        child: new Stack(
          children: <Widget>[
            new Positioned.fill(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                      decoration: new BoxDecoration(
                        color: new Color(0xFFE57373),
                      ),
                      child: new IconButton(
                          icon: new Icon(Icons.delete),
                          color: new Color(0xFFFFFFFF),
                          onPressed: widget.onPressed)),
                ],
              ),
            ),
            new SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: new Offset(this.flingOpening, 0.0),
                ).animate(_animation),
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border(
                      top: new BorderSide(
                          style: BorderStyle.solid, color: Colors.black26),
                    ),
                    color: new Color(0xFFFFFFFF),
                  ),
                  margin: new EdgeInsets.only(top: 0.0, bottom: 0.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                                margin: new EdgeInsets.only(left: 16.0),
                                padding: new EdgeInsets.only(
                                    right: 40.0, top: 4.5, bottom: 4.5),
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      margin: new EdgeInsets.only(right: 16.0),
                                      child: new Icon(
                                        Icons.insert_emoticon,
                                        //color: Colors.black,
                                        size: 45.0,
                                      ),
                                    ),
                                    new Text(widget.category),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
