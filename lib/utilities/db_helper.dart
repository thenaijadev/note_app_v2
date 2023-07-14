import 'package:intl/intl.dart';
import 'package:netapp/utilities/logger.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  SQLHelper();

  factory SQLHelper.getInstance() => SQLHelper();

  Future<void> createTables(sql.Database database) async {
    await database.execute("""
CREATE TABLE data(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  customer TEXT,
  brandCategory TEXT,
  brand TEXT,
  category TEXT,
  quantity INTEGER,
  type TEXT,
  product TEXT,
  date TEXT,
  image TEXT,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIME
)""");
  }

  Future<sql.Database> db() async {
    return sql.openDatabase(
      "database_name.db",
      version: 2,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future<int> createData(
      {required String customer,
      required String category,
      required String brandCategory,
      required String brand,
      required String product,
      required int quantity,
      required String type,
      required String image}) async {
    final db = await SQLHelper.getInstance().db();
    var now = DateTime.now();
    String date = DateFormat().format(now);
    final data = {
      "customer": customer,
      "brandCategory": brandCategory,
      "brand": brand,
      "category": category,
      "quantity": quantity,
      "type": type,
      "product": product,
      "date": date,
      "image": image,
    };

    final id = await db.insert("data", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

//   Future<List<Map<String, dynamic>>> getData() async {
//     final db = await SQLHelper.getInstance().db();

//     // List<DocumentSnapshot> documents = await FirestoreHelper.getAllDocuments();
//     // List<Map<String, dynamic>> list = convertToMapList(documents);
// //  db.query("data", orderBy: "id")
//     return list;
//   }

  Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.getInstance().db();
    return db.query("data", where: "id = ?", whereArgs: [id], limit: 1);
  }

  Future<int> updateData(
      {required int id,
      required String customer,
      required String category,
      required String brandCategory,
      required String brand,
      required String product,
      required int quantity,
      required String type}) async {
    final db = await SQLHelper.getInstance().db();
    final data = {
      "customer": customer,
      "brandCategory": brandCategory,
      "brand": brand,
      "category": category,
      "quantity": quantity,
      "type": type,
      "product": product,
      "createdAt": DateTime.now().toString(),
    };
    final result =
        await db.update("data", data, where: "id = ?", whereArgs: [id]);
    logger.e(result);
    return result;
  }

  Future<void> deleteData(
    int id,
  ) async {
    final db = await SQLHelper.getInstance().db();
    try {
      await db.delete("data", where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }

  // List<Map<String, dynamic>> convertToMapList(
  //     List<DocumentSnapshot> documents) {
  //   List<Map<String, dynamic>> mapList = [];

  //   for (DocumentSnapshot document in documents) {
  //     Map<String, dynamic> documentData =
  //         document.data() as Map<String, dynamic>;
  //     mapList.add(documentData);
  //   }

  //   return mapList;
  // }
}
