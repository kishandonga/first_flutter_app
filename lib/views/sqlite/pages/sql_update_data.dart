import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';
import 'package:flutter_app/views/sqlite/pages/sql_update_student.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({ Key key }) : super(key: key);

  @override
  UpdateDataState createState() {
    return new UpdateDataState();
  }
}

class UpdateDataState extends State<UpdateData> {
  Future<List<StudentModel>> studentList;

  @override
  void initState() {
    super.initState();
    studentList = getStudentList();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      trailing: const Icon(Icons.update),
                      subtitle: new Text(values[index].studentEdu),
                      title: new Text(values[index].studentName),
                      onTap: () async {
                        String result = await Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) =>
                                  new UpdateStudentForm(values[index])
                            ));

                        //Update list
                        if(result == Const.Update){
                          setState(() {
                            studentList = getStudentList();
                          });
                        }

                      })),
            ],
          );
        },
      );
    }

    var futureBuilder = new FutureBuilder(
      future: studentList,
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
