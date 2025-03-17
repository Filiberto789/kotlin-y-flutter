import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'scores.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE scores (id INTEGER PRIMARY KEY AUTOINCREMENT, score INTEGER)',
        );
      },
    );
  }

  Future<void> insertScore(int score) async {
    final db = await database;
    await db.insert(
      'scores',
      {'score': score},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> getLastScore() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'scores',
      orderBy: 'id DESC',
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return maps.first['score'] as int;
    } else {
      return 0;
    }
  }
}