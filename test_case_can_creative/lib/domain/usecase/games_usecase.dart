import 'package:dartz/dartz.dart';
import 'package:test_case_can_creative/data/model/model_favorite.dart';
import 'package:test_case_can_creative/data/model/model_games.dart';
import 'package:test_case_can_creative/domain/failures/failures.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:test_case_can_creative/domain/model/publisher_entity.dart';
import 'package:test_case_can_creative/domain/repo/games_repo.dart';

class GamesUsecase {
  GamesRepo gamesRepo;
  GamesUsecase({required this.gamesRepo});
  Future<Either<Failures, List<GamesModel>>> getGames(int page, int pageSize) {
    return gamesRepo.getGames(page, pageSize);
  }

  Future<Either<Failures, List<GamesModel>>> searchGames(String name) {
    return gamesRepo.searchGames(name);
  }

  Future<Either<Failures, GamesModel>> getDetailGames(int id) {
    return gamesRepo.getDetailGames(id);
  }

  Future<void> addGamesFavorite(GamesEntity gamesFavoriteModel) {
    return gamesRepo
        .addFavorite(GamesFavoriteModel.fromEntity(gamesFavoriteModel));
  }

  Future<void> deleteGamesFavorite(GamesEntity gamesFavoriteModel) {
    return gamesRepo
        .deleteFavorite(GamesFavoriteModel.fromEntity(gamesFavoriteModel));
  }

  Future<List<GamesEntity>> getListGamesFavorite() async {
    List<GamesFavoriteModel> list = await gamesRepo.getListGamesFavorite();
    return list.map((e)=> GamesEntity(
      id: e.id,
      desc: e.desc,
      imgUrl: e.imgUrl,
      name: e.name,
      playing: e.playing,
      publish: [PublisherEntity(name: e.publish)],
      rating: e.rating,
      released: e.released,
    )).toList();
  }
}
