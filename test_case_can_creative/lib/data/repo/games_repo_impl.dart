import 'package:dartz/dartz.dart';
import 'package:test_case_can_creative/data/model/model_favorite.dart';
import 'package:test_case_can_creative/data/model/model_games.dart';
import 'package:test_case_can_creative/data/source/local/app_database.dart';
import 'package:test_case_can_creative/data/source/remote/source_game.dart';
import 'package:test_case_can_creative/domain/failures/failures.dart';
import 'package:test_case_can_creative/domain/repo/games_repo.dart';

class GamesRepoImpl implements GamesRepo {
  final SourceGame sourceGame;
  AppDatabase appDatabase;
  GamesRepoImpl({
    required this.sourceGame,
    required this.appDatabase,
  });
  @override
  Future<Either<Failures, GamesModel>> getDetailGames(int id) async {
    try {
      final result = await sourceGame.getDetailGames(id);
      return result.fold((message) => left(ServerFailure(message: message)),
          (data) => right(data));
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failures, List<GamesModel>>> getGames(
      int page, int pageSize) async {
    try {
      final result = await sourceGame.getGames(page, pageSize);
      return result.fold((message) => left(ServerFailure(message: message)),
          (data) => right(data));
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failures, List<GamesModel>>> searchGames(String name) async {
    try {
      final result = await sourceGame.searchGames(name);
      return result.fold((message) => left(ServerFailure(message: message)),
          (data) => right(data));
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<void> addFavorite(GamesFavoriteModel gamesFavoriteModel) {
    return appDatabase.gamesDao.insertGames(gamesFavoriteModel);
  }

  @override
  Future<void> deleteFavorite(GamesFavoriteModel gamesFavoriteModel) {
    return appDatabase.gamesDao.deleteGames(gamesFavoriteModel);
  }

  @override
  Future<List<GamesFavoriteModel>> getListGamesFavorite() {
    return appDatabase.gamesDao.getListGamesFavorite();
  }
}
