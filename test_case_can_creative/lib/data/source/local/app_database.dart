import 'package:floor/floor.dart';
import 'package:test_case_can_creative/data/model/model_favorite.dart';
import 'package:test_case_can_creative/data/source/local/dao/games_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [GamesFavoriteModel])
abstract class AppDatabase extends FloorDatabase {
  GamesDao get gamesDao;
}
