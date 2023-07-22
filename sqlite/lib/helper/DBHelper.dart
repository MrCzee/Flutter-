import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite/product_list.dart';

import '../model/model_dast.dart';

class DBHelper {
  Database? _db;

  initDb() async {
    String databasePath = await getDatabasesPath(); // getDatabasesPath is a predefined method to where we locate our date / store our date at which location
    String path = join(databasePath, 'dishes.db');
    var db = openDatabase(path, version: 1, onCreate: onCreate);
    return db;
  }

  void onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE dishes(name TEXT, descr TEXT, price INTEGER)");
    // await db.execute('CREATE TABLE dishes, (id PRIMARY KEY, name TEXT, desc TEXT, price INTEGER)');
  }

  Future<Database?> get db async {
    if (_db != null) {
      // _db = await initDb(); // if database is null so we will create our data in initDB
      return _db!;
    } else {
      _db = await initDb();
      //return _db;// else if data is already stored in table will will return the existed database table
    }
  }

  // create data
  Future<int> createData(ModelDash dish) async
  {
    var readydb =  await db;
   return await readydb!.rawInsert("INSERT INTO dishes(name, descr , price)VALUES ('${dish.name}','${dish.description}', '${dish.price}')");
  }
  // update
  Future<int> updateData(ModelDash dish)async
  {
    var readydb = await db;

    return await readydb!.rawInsert("UPDATE dishes  SET descr = '${dish.description}', price = '${dish.price}', WHERE name = '${dish.name}')");
  }
  // delete data
  Future<int> deleteData(String name) async
  {
    var readydb = await db;
    return await readydb!.rawDelete("DELETE FROM dishes WHERE name = '$name'");
  }

  // read data

Future<ModelDash> readData(String name) async
{
  var readydb = await db;
  var read = await readydb!.rawQuery("SELECT * FROM dishes WHERE name = '$name'");
  return ModelDash.fromMap(read[0]);
}
  Future<List<ModelDash>> readAllData()async
  {
    var dbready = await db;
    List<Map> list = await dbready!.rawQuery("SELECT * FROM dishes");

    List<ModelDash>  dish  = list.cast<ModelDash>();
     for(int i=0;i< list.length;i++)
       {
         dish.add(ModelDash(list[i]["name"],list[i]["descr"], list[i]["price"]));
       }
     return dish;
  }

}
