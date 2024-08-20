import 'dart:io';
import 'package:favorite_places/model/place.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart' as sysPath;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final dbPath = await sql.getDatabasesPath();

    final db = await sql.openDatabase(path.join(dbPath, 'Places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);

    final data = await db.query('user_places');
    final places = data
        .map(
          (item) => Place(
            id: item['id'] as String,
            title: item['title'] as String,
            image: File(item['image'] as String),
          ),
        )
        .toList();

    state = places;
  }

  void addPlace(String name, File image) async {
    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy("${appDir.path}/${fileName}");

    final dbPath = await sql.getDatabasesPath();
    final newPlace = Place(title: name, image: copiedImage);

    final db = await sql.openDatabase(path.join(dbPath, 'Places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);

    db.insert("user_places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path
    });

    state = [newPlace, ...state];
  }
}

final userPlaceProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>(
  (ref) => UserPlaceNotifier(),
);
