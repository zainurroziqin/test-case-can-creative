import 'package:equatable/equatable.dart';

class PublisherEntity extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? urlImg;

  const PublisherEntity({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.urlImg,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        gamesCount,
        urlImg,
      ];
}
