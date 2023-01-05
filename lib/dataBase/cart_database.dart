import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/model/cart_product.dart';
import 'package:food_delivery/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class CartDataBase{
  CartDataBase._();
  static final CartDataBase db = CartDataBase._();
  static Database ?_dataBase;
  Future<Database> get database async{
    if (_dataBase == null) {
      _dataBase = await initdb();
    }
    return _dataBase!;
  }
  initdb() async {
    String path=join(await getDatabasesPath() , 'CartProduct');
    return await openDatabase(path,
    version: 1,
      onCreate: (Database db,int version) async{
      await db.execute('''
      CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnProductId TEXT NOT NULL)
      ''');
      }
    );
  }
  Future<List<CartProduct>>getAllProduct()async{
    var db = await database;
    List<Map> maps=await db.query(tableCartProduct);
    List <CartProduct> list= maps.isNotEmpty?
        maps.map((product) => CartProduct.fromJson(product)).toList()
        :[];
    return list;
  }
  insert (CartProduct model)async {
    var db = await database;
    await db.insert(tableCartProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace,);
  }
  updateProduct(CartProduct model)async{
    var db = await database;
    return await db.update(tableCartProduct, model.toJson(),where: '$columnProductId= ?',whereArgs: [model.productID]);
  }
}