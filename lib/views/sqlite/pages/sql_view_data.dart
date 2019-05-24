import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';

class ViewStudentData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      List<StudentModel> values = snapshot.data;
      return new ListView.builder(
        padding: new EdgeInsets.all(4.0),
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new Card(
                  elevation: 3.0,
                  child: new ListTile(
                    subtitle: new Text(values[index].studentEdu),
                    title: new Text(values[index].studentName),
                  )),
            ],
          );
        },
      );
    }

    var futureBuilder = new FutureBuilder(
      future: getStudentList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(body: futureBuilder);
  }

  Future<List<StudentModel>> getStudentList() async {
    StudentBLL bll = new StudentBLL();
    List<StudentModel> list = await bll.getStudentList();
    return list;
  }
}
