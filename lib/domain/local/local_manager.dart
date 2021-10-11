import 'package:path/path.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:sqflite/sqflite.dart';

import 'db/database_constant.dart';

class LocalManager {
  static LocalManager? _instance;
  static Database? _database;

  static Future<LocalManager> getInstance() async {
    if (_instance == null) {
      _instance = LocalManager();
    }
    if (_database == null) {
      _database =
          await openDatabase(join(await getDatabasesPath(), DATABASE_NAME),
              onCreate: (db, version) async {
        await createTable(db, version);
        print("table product is creaated");
      }, version: 1);
    }

    return _instance!;
  }

  static Future<void> createTable(Database db, int version) {
    return db.execute(CREATE_PRODUCT_TABLE);
  }

  Future<void> insertData(List<Products> products) async {
    await _database?.delete(PRODUCTS_TABLE);
    Batch? batch = _database?.batch();
    products.forEach((e) {
      batch?.insert(
        PRODUCTS_TABLE,
        e.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });

    await batch?.commit();
  }

  Future<List<Products>?> getListOfProducts(String query) async {
    final List<Map<String, dynamic>>? maps =
        await _database?.query(PRODUCTS_TABLE,where: getSearchQuery(query) );
    print(maps);
    if (maps != null) {
      return List.generate(maps.length, (i) {
        return Products.fromJsonDB(maps[i]);
      });
    } else
      return null;
  }
}
