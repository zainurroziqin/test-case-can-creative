import 'package:equatable/equatable.dart';
import 'package:test_case_can_creative/data/model/model_publisher.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class GamesModel extends GamesEntity with EquatableMixin {
  const GamesModel({
    int? id,
    String? name,
    String? released,
    String? imgUrl,
    double? rating,
    List<PublisherModel>? publish,
    int? playing,
    String? desc,
  }) : super(
          id: id,
          name: name,
          released: released,
          imgUrl: imgUrl,
          rating: rating,
          publish: publish,
          playing: playing,
          desc: desc,
        );

  factory GamesModel.fromJson(Map<String, dynamic> json) => GamesModel(
        id: json["id"],
        name: json["name"],
        released: json["released"],
        imgUrl: json["background_image"],
        rating: json["rating"],
        publish: json["publishers"] != null
            ? List<PublisherModel>.from(
                json["publishers"].map((x) => PublisherModel.fromJson(x)))
            : null,
        playing: json["playtime"],
        desc: json["description"],
      );
}
