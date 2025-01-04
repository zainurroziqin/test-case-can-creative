import 'package:equatable/equatable.dart';
import 'package:test_case_can_creative/domain/model/publisher_entity.dart';

class PublisherModel extends PublisherEntity with EquatableMixin {
  const PublisherModel({
    int? id,
    String? name,
    String? slug,
    int? gamesCount,
    String? urlImg,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          gamesCount: gamesCount,
          urlImg: urlImg,
        );

  factory PublisherModel.fromJson(Map<String, dynamic> json) => PublisherModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      gamesCount: json["games_count"],
      urlImg: json["image_background"]);
}
