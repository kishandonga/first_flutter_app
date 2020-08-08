import 'dart:async';

import 'package:flutter_app/views/sqlite/helper/databse_client.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

class StudentBLL {
  DatabaseClient client = DatabaseClient();
  Database db;

  static const String studentId = "ID";
  static const String studentName = "NAME";
  static const String studentEdu = "EDU";
  static const String studentFees = "FEES";

  Future<int> insertStudent(StudentModel model) async {
    int id;
    db = await client.open();
    await db.transaction((txn) async {
      var query = StringBuffer();
      query.write(
          "INSERT INTO Student($studentId, $studentName, $studentEdu, $studentFees) VALUES(");
      query.write(model.id);
      query.write(",");
      query.write("'");
      query.write(model.studentName);
      query.write("'");
      query.write(",");
      query.write("'");
      query.write(model.studentEdu);
      query.write("'");
      query.write(",");
      query.write(model.fees);
      query.write(");");

      id = await txn.rawInsert(query.toString());
    });
    await client.close();
    return id;
  }

  Future<int> deleteStudent(StudentModel model) async {
    db = await client.open();
    int count = await db
        .rawDelete('DELETE FROM Student WHERE $studentId = ?', [model.id]);
    client.close();
    return count;
  }

  Future<int> update(StudentModel model) async {
    db = await client.open();
    var query = StringBuffer();
    query.write("UPDATE Student SET ");
    query.write('$studentName=');
    query.write("'");
    query.write(model.studentName);
    query.write("'");
    query.write(",");
    query.write('$studentEdu=');
    query.write("'");
    query.write(model.studentEdu);
    query.write("'");
    query.write(",");
    query.write('$studentFees=');
    query.write(model.fees);
    query.write(" WHERE ");
    query.write('$studentId=');
    query.write(model.id);

    print("TAG_DATA " + query.toString());
    int count = await db.rawUpdate(query.toString());
    client.close();
    return count;
  }

  Future<List<Map>> getStudentMapList() async {
    db = await client.open();
    List<Map> map = await db.rawQuery('SELECT * FROM Student');
    client.close();
    return map;
  }

  Future<List<StudentModel>> getStudentList() async {
    db = await client.open();
    List<Map> mapList = await db.rawQuery('SELECT * FROM Student');
    client.close();
    List<StudentModel> listModel = [];
    mapList.forEach((map) => listModel.add(fromMap(map)));
    return listModel;
  }

  Future<int> getCount() async {
    db = await client.open();
    int count = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM Student"));
    client.close();
    return count;
  }

  StudentModel fromMap(Map map) {
    StudentModel model = StudentModel();
    model.id = map[studentId];
    model.studentName = map[studentName];
    model.studentEdu = map[studentEdu];
    model.fees = map[studentFees];
    return model;
  }

  Map toMap(StudentModel model) {
    Map map = {
      studentId: model.id,
      studentName: model.studentName,
      studentEdu: model.studentEdu,
      studentFees: model.fees
    };
    return map;
  }
}
