import 'dart:async';

import 'package:first_flutter_app/views/sqlite/helper/database_client.dart';
import 'package:first_flutter_app/views/sqlite/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

class StudentBLL {
  static const String studentId = "ID";
  static const String studentName = "NAME";
  static const String studentEdu = "EDU";
  static const String studentFees = "FEES";

  Future<int> insertStudent(StudentModel model) async {
    int id = 0;
    var db = DatabaseClient.instance.database();
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
    return id;
  }

  Future<int> deleteStudent(StudentModel model) async {
    var db = DatabaseClient.instance.database();
    int count = await db
        .rawDelete('DELETE FROM Student WHERE $studentId = ?', [model.id]);
    return count;
  }

  Future<int> update(StudentModel model) async {
    var db = DatabaseClient.instance.database();
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

    int count = await db.rawUpdate(query.toString());
    return count;
  }

  Future<List<Map>> getStudentMapList() async {
    var db = DatabaseClient.instance.database();
    List<Map> map = await db.rawQuery('SELECT * FROM Student');
    return map;
  }

  Future<List<StudentModel>> getStudentList() async {
    var db = DatabaseClient.instance.database();
    List<Map> mapList = await db.rawQuery('SELECT * FROM Student');
    List<StudentModel> listModel = [];
    for (var map in mapList) {
      listModel.add(fromMap(map));
    }
    return listModel;
  }

  Future<int> getCount() async {
    var db = DatabaseClient.instance.database();
    int? count = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM Student"));
    return count ?? 0;
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
