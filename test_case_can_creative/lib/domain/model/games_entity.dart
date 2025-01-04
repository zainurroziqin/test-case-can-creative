import 'package:equatable/equatable.dart';
import 'package:test_case_can_creative/domain/model/publisher_entity.dart';

class GamesEntity extends Equatable {
  final int? id;
  final String? name;
  final String? released;
  final String? imgUrl;
  final double? rating;
  final List<PublisherEntity>? publish;
  final int? playing;
  final String? desc;

  const GamesEntity({
    this.id,
    this.name,
    this.released,
    this.imgUrl,
    this.rating,
    this.publish,
    this.playing,
    this.desc,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        released,
        imgUrl,
        rating,
        publish,
        playing,
        desc,
      ];
}
