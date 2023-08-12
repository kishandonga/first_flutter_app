import 'dart:async';

import 'package:first_flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  static final DatabaseClient _mInstance = DatabaseClient._internal();
  Database? _matchItDb;
  DatabaseClient._internal();

  static DatabaseClient get instance {
    return _mInstance;
  }

  Database database() {
    if (_matchItDb == null) {
      throw Exception("Not yet called init() method");
    }
    return _matchItDb!;
  }

  Future<void> init() async {
    if (_matchItDb == null) {
      String dbPath = "${await getDatabasesPath()}/student.db";
      _matchItDb = await openDatabase(dbPath, version: 1, onCreate: _createDb);
    }
  }

  void _createDb(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE IF NOT EXISTS Student (${StudentBLL.studentId} INTEGER PRIMARY_KEY, ${StudentBLL.studentName} TEXT, ${StudentBLL.studentEdu} TEXT, ${StudentBLL.studentFees} REAL)");
  }
}
