import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/post_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('posts.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE posts (
  id $idType,
  userId $integerType,
  title $textType,
  body $textType
  )
''');
  }

  Future<void> insertPosts(List<PostModel> posts) async {
    final db = await instance.database;
    final batch = db.batch();
    for (var post in posts) {
      batch.insert(
        'posts',
        post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<PostModel>> getPosts() async {
    final db = await instance.database;
    final maps = await db.query('posts');

    if (maps.isNotEmpty) {
      return maps.map((json) => PostModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<void> clearPosts() async {
    final db = await instance.database;
    await db.delete('posts');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
