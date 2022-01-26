import 'dart:async';
import 'dart:io';

import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  late Database db;

  Future<Database> open() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, "student.db");
    db = await openDatabase(dbPath, version: 1,
        onCreate: (Database database, int version) async {
      // When creating the db, create the table
      await database.execute(
          "CREATE TABLE IF NOT EXISTS Student (${StudentBLL.studentId} INTEGER PRIMARY_KEY, ${StudentBLL.studentName} TEXT, ${StudentBLL.studentEdu} TEXT, ${StudentBLL.studentFees} REAL)");
    });

    return db;
  }

  close() async {
    await db.close();
  }
}
