import 'dart:async';

import 'package:first_flutter_app/pages/sqlite/helper/student_bll.dart';
import 'package:first_flutter_app/pages/sqlite/model/student_model.dart';
import 'package:first_flutter_app/pages/sqlite/pages/sql_update_student.dart';
import 'package:first_flutter_app/utils/const.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({Key? key}) : super(key: key);

  @override
  State<UpdateData> createState() => UpdateDataState();
}

class UpdateDataState extends State<UpdateData> {
  late Future<List<StudentModel>> studentList;

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
      return ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                elevation: 3.0,
                child: ListTile(
                  trailing: const Icon(Icons.update),
                  subtitle: Text(values[index].studentEdu),
                  title: Text(values[index].studentName),
                  onTap: () async {
                    String? result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateStudentForm(
                          values[index],
                        ),
                      ),
                    );

                    //Update list
                    if (result != null && result == Const.isUpdated) {
                      setState(() {
                        studentList = getStudentList();
                      });
                    }
                  },
                ),
              ),
            ],
          );
        },
      );
    }

    var futureBuilder = FutureBuilder(
      future: studentList,
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
