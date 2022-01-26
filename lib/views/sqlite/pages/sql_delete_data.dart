import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({Key? key}) : super(key: key);

  @override
  DeleteDataState createState() => DeleteDataState();
}

class DeleteDataState extends State<DeleteData> {
  late Future<List<StudentModel>> list;
  StudentBLL bll = StudentBLL();

  @override
  void initState() {
    super.initState();
    list = getStudentList();
  }

  void refreshList() {
    setState(() {
      list = getStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      List<StudentModel> values = snapshot.data;
      return ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3.0,
            child: ListTile(
              trailing: GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () async {
                  int count = await bll.deleteStudent(values[index]);
                  if (count > 0) {
                    refreshList();
                  }
                },
              ),
              subtitle: Text(values[index].studentEdu),
              title: Text(values[index].studentName),
            ),
          );
        },
      );
    }

    var futureBuilder = FutureBuilder(
      future: list,
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
    List<StudentModel> list = await bll.getStudentList();
    return list;
  }
}
