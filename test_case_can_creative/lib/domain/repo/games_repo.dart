import 'package:dartz/dartz.dart';
import 'package:test_case_can_creative/data/model/model_favorite.dart';
import 'package:test_case_can_creative/data/model/model_games.dart';
import 'package:test_case_can_creative/domain/failures/failures.dart';

abstract class GamesRepo {
  Future<Either<Failures, List<GamesModel>>> getGames(int page, int pageSize);
  Future<Either<Failures, List<GamesModel>>> searchGames(String name);
  Future<Either<Failures, GamesModel>> getDetailGames(int id);
  Future<void> addFavorite(GamesFavoriteModel gamesFavoriteModel);
  Future<void> deleteFavorite(GamesFavoriteModel gamesFavoriteModel);
  Future<List<GamesFavoriteModel>> getListGamesFavorite();
}
