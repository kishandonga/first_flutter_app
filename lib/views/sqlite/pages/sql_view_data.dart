import 'dart:async';

import 'package:first_flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:first_flutter_app/views/sqlite/model/student_model.dart';
import 'package:flutter/material.dart';

class ViewStudentData extends StatelessWidget {
  const ViewStudentData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      List<StudentModel> values = snapshot.data;
      return ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                  elevation: 3.0,
                  child: ListTile(
                    subtitle: Text(values[index].studentEdu),
                    title: Text(values[index].studentName),
                  )),
            ],
          );
        },
      );
    }

    var futureBuilder = FutureBuilder(
      future: getStudentList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return createListView(context, snapshot);
            }
        }
      },
    );

    return Scaffold(body: futureBuilder);
  }

  Future<List<StudentModel>> getStudentList() async {
    StudentBLL bll = StudentBLL();
    List<StudentModel> list = await bll.getStudentList();
    return list;
  }
}
