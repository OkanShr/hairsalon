import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE customers(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      customername TEXT,
      haircolor TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('hairsalon-db.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      print("creating a table...");
      await createTables(database);
    });
  }

  static Future<int> createCustomer(
      String customername, String? haircolor) async {
    final db = await SQLHelper.db();

    final data = {'customername': customername, 'haircolor': haircolor};
    final id = await db.insert('customers', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getCustomers() async {
    final db = await SQLHelper.db();
    return db.query('customers', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getCustomer(int id) async {
    final db = await SQLHelper.db();
    return db.query('customers', orderBy: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateCustomer(
      int id, String customername, String? haircolor) async {
    final db = await SQLHelper.db();

    final data = {'customername': customername, 'haircolor': haircolor};

    final result =
        await db.update('customers', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteCustomer(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("customers", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong deleting Customer: $err");
    }
  }
}
