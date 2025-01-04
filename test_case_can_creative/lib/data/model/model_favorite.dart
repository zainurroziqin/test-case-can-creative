import 'package:floor/floor.dart';
import 'package:test_case_can_creative/data/model/model_publisher.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:test_case_can_creative/domain/model/publisher_entity.dart';

@Entity(
  tableName: "games",
  primaryKeys: ['id'],
)
class GamesFavoriteModel {
  @primaryKey
  final int? id;
  final String? name;
  final String? released;
  final String? imgUrl;
  final double? rating;
  final String? publish;
  final int? playing;
  final String? desc;
  GamesFavoriteModel({
    this.id,
    this.name,
    this.released,
    this.imgUrl,
    this.rating,
    this.publish,
    this.playing,
    this.desc,
  });

  factory GamesFavoriteModel.fromEntity(GamesEntity gamesEntity) =>
      GamesFavoriteModel(
        id: gamesEntity.id,
        name: gamesEntity.name,
        released: gamesEntity.released,
        imgUrl: gamesEntity.imgUrl,
        rating: gamesEntity.rating,
        publish: gamesEntity.publish?[0].name,
        playing: gamesEntity.playing,
        desc: gamesEntity.desc,
      );
}
