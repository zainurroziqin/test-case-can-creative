import 'package:floor/floor.dart';
import 'package:test_case_can_creative/data/model/model_favorite.dart';
import 'package:test_case_can_creative/data/model/model_games.dart';

@dao
abstract class GamesDao {
  @Insert()
  Future<void> insertGames(GamesFavoriteModel gamesFavoriteModel);

  @delete
  Future<void> deleteGames(GamesFavoriteModel gamesFavoriteModel);

  @Query('SELECT * FROM games')
  Future<List<GamesFavoriteModel>> getListGamesFavorite();

}
