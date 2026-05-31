import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/post_model.dart';
import '../../../domain/entities/outbox_mutation.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('posts_v2.db'); // Change name to force fresh DB since we changed ID types
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE posts (
  id $idType,
  userId $integerType,
  title $textType,
  body $textType,
  isSyncPending $integerType DEFAULT 0,
  hasSyncFailed $integerType DEFAULT 0
  )
''');

    await db.execute('''
CREATE TABLE outbox (
  id $idType,
  method $textType,
  path $textType,
  payload $textType,
  createdAt $integerType,
  retryCount $integerType DEFAULT 0,
  localEntityId $textType
  )
''');
  }

  // --- Post Methods ---

  Future<void> insertPost(PostModel post) async {
    final db = await instance.database;
    await db.insert('posts', post.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertPosts(List<PostModel> posts) async {
    final db = await instance.database;
    final batch = db.batch();
    for (var post in posts) {
      // Don't overwrite pending offline posts if they exist in the incoming batch, 
      // but usually the server won't return pending posts.
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

  Future<void> clearNonPendingPosts() async {
    final db = await instance.database;
    // Only clear posts that are NOT pending sync
    await db.delete('posts', where: 'isSyncPending = ?', whereArgs: [0]);
  }

  Future<void> deletePost(String id) async {
    final db = await instance.database;
    await db.delete('posts', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> markPostSyncFailed(String id, bool failed) async {
    final db = await instance.database;
    await db.update('posts', {'hasSyncFailed': failed ? 1 : 0}, where: 'id = ?', whereArgs: [id]);
  }

  // --- Outbox Methods ---

  Future<void> insertOutboxMutation(OutboxMutation mutation) async {
    final db = await instance.database;
    await db.insert('outbox', mutation.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<OutboxMutation>> getOutboxMutations() async {
    final db = await instance.database;
    final maps = await db.query('outbox', orderBy: 'createdAt ASC');

    if (maps.isNotEmpty) {
      return maps.map((json) => OutboxMutation.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<void> deleteOutboxMutation(String id) async {
    final db = await instance.database;
    await db.delete('outbox', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> incrementOutboxRetryCount(String id) async {
    final db = await instance.database;
    await db.rawUpdate('UPDATE outbox SET retryCount = retryCount + 1 WHERE id = ?', [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
