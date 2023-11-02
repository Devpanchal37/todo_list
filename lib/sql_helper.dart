import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE student_table(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    date TEXT,
    complete TEXT,
    createdAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('studentsdb.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      print("create tableeeeeeeeeee");
      await createTables(database);
    });
  }

  static Future<int> createItem(
      String name, String date, String? complete) async {
    print("connectinggggg databasesss");
    final db = await SQLHelper.db();
    print("database connnecteddddddddd");
    final data = {'name': name, 'date': date, 'complete': complete};
    print("dataaaaaaaaaaaa");
    final id = await db.insert('student_table', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("item is createdddddddddddddddd");
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('student_table', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(
      String completeValue) async {
    final db = await SQLHelper.db();
    // return db.query('student_table', where: "complete = true", whereArgs: [complete]);
    return db.query('student_table',
        where: "complete = ?", whereArgs: [completeValue]);
  }

  static Future<int> updateItem(int id, String? complete) async {
    final db = await SQLHelper.db();
    final data = {'complete': complete, 'CreatedAT': DateTime.now().toString()};
    final result = await db
        .update('student_table', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("student_table", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("something went wrong");
    }
  }
}
