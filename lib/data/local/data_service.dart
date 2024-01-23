import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:youtube_music_redesign/data/remote/model/song_model.dart';

class SqliteService {
  final String databaseName = 'musicDb';
  final String tableName = 'musicdata';

  Future<Database> initDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, databaseName),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, musicName TEXT NOT NULL, releaseDate TEXT NOT NULL, artistName TEXT NOT NULL, imgUrl TEXT NOT NULL, audioUrl TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<void> addMusic(SongModel song) async {
    final Database db = await initDB();
    await db.insert(
      tableName,
      song.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SongModel>> getMusic() async {
    final db = await initDB();
    final List<Map<String, Object?>> queryResult = await db.query(tableName);
    return queryResult.map((e) => SongModel.fromJson(e)).toList();
  }
}
