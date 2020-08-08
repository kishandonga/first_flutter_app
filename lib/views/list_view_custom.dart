import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';

class CategoryStatePage extends StatefulWidget {
  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryStatePage> {
  List<Widget> listCategories = [];
  List<ItemModel> list = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      list.add(ItemModel(0, 'foo00'));
      list.add(ItemModel(1, 'foo01'));
      list.add(ItemModel(2, 'foo02'));
      list.add(ItemModel(3, 'foo03'));
      list.add(ItemModel(4, 'foo04'));
      list.add(ItemModel(5, 'foo05'));
      list.add(ItemModel(6, 'foo06'));
      list.add(ItemModel(7, 'foo07'));
      list.add(ItemModel(8, 'foo08'));
      list.add(ItemModel(9, 'foo09'));
      list.add(ItemModel(10, 'foo10'));
      list.add(ItemModel(11, 'foo11'));
      list.add(ItemModel(12, 'foo12'));
      list.add(ItemModel(13, 'foo13'));
      list.add(ItemModel(14, 'foo14'));
      list.add(ItemModel(15, 'foo15'));
      list.add(ItemModel(16, 'foo16'));
      list.add(ItemModel(17, 'foo17'));
      list.add(ItemModel(18, 'foo18'));
      list.add(ItemModel(19, 'foo19'));
      list.add(ItemModel(20, 'foo20'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Const.ListView)),
        body: ListView(
            padding: EdgeInsets.only(top: 8.0, right: 0.0, left: 0.0),
            children: buildListCategories(this.list)));
  }

  List<Widget> buildListCategories(List<ItemModel> list) {
    listCategories = [];

    for (var im in list) {
      var id = im.id;
      var category = im.category;

      listCategories.add(ItemCategory(
          key: ObjectKey(id),
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
  ItemCategoryState createState() => ItemCategoryState();
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
    _controller = AnimationController(
        duration: const Duration(milliseconds: 246), vsync: this);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1.0, curve: Curves.linear),
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

    return GestureDetector(
        onHorizontalDragUpdate: _move,
        onHorizontalDragEnd: _settle,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE57373),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.delete),
                          color: Color(0xFFFFFFFF),
                          onPressed: widget.onPressed)),
                ],
              ),
            ),
            SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: Offset(this.flingOpening, 0.0),
                ).animate(_animation),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          style: BorderStyle.solid, color: Colors.black26),
                    ),
                    color: Color(0xFFFFFFFF),
                  ),
                  margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 16.0),
                                padding: EdgeInsets.only(
                                    right: 40.0, top: 4.5, bottom: 4.5),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(right: 16.0),
                                      child: Icon(
                                        Icons.insert_emoticon,
                                        //color: Colors.black,
                                        size: 45.0,
                                      ),
                                    ),
                                    Text(widget.category),
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
