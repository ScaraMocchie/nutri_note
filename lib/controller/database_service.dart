import 'package:nutri_note/controller/food_model.dart';
import 'package:nutri_note/controller/list_makanan.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  final String _foodsTableName = 'foods';
  final String _foodsIdColumnName = 'id';
  final String _foodsNameColumnName = 'name';
  final String _foodsAmountColumnName = 'amount';
  final String _foodsCalColumnName = 'cal';
  final String _foodsCarbColumnName = 'carb';
  final String _foodsProteinColumnName = 'protein';
  final String _foodsFatColumnName = 'fat';

  DatabaseService._constructor();

  Future<void> insertDefaultFoods(Database db) async {


    for (String food in defaultFoods) {
      final List<String> values = food.split(", ");
      await db.insert(_foodsTableName, {
        _foodsNameColumnName: values[0],
        _foodsAmountColumnName: double.parse(values[2]).toInt(),
        _foodsCalColumnName: double.parse(values[1]).toInt(),
        _foodsCarbColumnName: double.parse(values[3]).toInt(),
        _foodsProteinColumnName: double.parse(values[4]).toInt(),
        _foodsFatColumnName: double.parse(values[5]).toInt(),
      });
    }
  }

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database =
        await openDatabase(databasePath, version: 1, onCreate: (db, version) async{
      db.execute('''
          CREATE TABLE $_foodsTableName(
            $_foodsIdColumnName INTEGER PRIMARY KEY,
            $_foodsNameColumnName TEXT NOT NULL,
            $_foodsAmountColumnName INTEGER NOT NULL,
            $_foodsCalColumnName INTEGER NOT NULL,
            $_foodsCarbColumnName INTEGER NOT NULL,
            $_foodsProteinColumnName INTEGER NOT NULL,
            $_foodsFatColumnName INTEGER NOT NULL
          )
          ''');
          await insertDefaultFoods(db);
    });
    
    return database;
  }

  void addFoods(
      String name, int amount, int cal, int carb, int protein, int fat) async {
    final db = await database;
    await db.insert(_foodsTableName, {
      _foodsNameColumnName: name,
      _foodsAmountColumnName: amount,
      _foodsCalColumnName: cal,
      _foodsCarbColumnName: carb,
      _foodsProteinColumnName: protein,
      _foodsFatColumnName: fat,
    });
  }

  Future<List<Food>?> getFood() async {
    final db = await database;
    final data = await db.query(_foodsTableName);
    // print(data);
    List<Food> foods = data
        .map((e) => Food(
            id: e['id'] as int,
            amount: e['amount'] as int,
            cal: e['cal'] as int,
            carb: e['carb'] as int,
            protein: e['protein'] as int,
            fat: e['fat'] as int,
            name: e['name'] as String))
        .toList();
    return foods;
  }

  void updateFood(int id, String name, int amount, int cal, int carb, int protein, int fat) async {
  final db = await database;
  await db.update(
    _foodsTableName,
    {
      _foodsNameColumnName: name,
      _foodsAmountColumnName: amount,
      _foodsCalColumnName: cal,
      _foodsCarbColumnName: carb,
      _foodsProteinColumnName: protein,
      _foodsFatColumnName: fat,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

}
