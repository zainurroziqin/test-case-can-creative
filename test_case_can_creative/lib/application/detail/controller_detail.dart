import 'package:get/get.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:test_case_can_creative/domain/usecase/games_usecase.dart';
import 'package:test_case_can_creative/utils/failure_message.dart';

class ControllerDetail extends GetxController {
  GamesUsecase gamesUsecase;
  ControllerDetail({required this.gamesUsecase});

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _message = "".obs;
  String get message => _message.value;

  final _data = const GamesEntity().obs;
  GamesEntity get data => _data.value;

  final _isFavorite = false.obs;
  bool get isFavorite => _isFavorite.value;
  setFavorite(bool e) => _isFavorite.value = e;

  getDetailGames(int id) async {
    _loading.value = true;
    final result = await gamesUsecase.getDetailGames(id);
    result.fold((message) {
      _message.value = FailureMessage.mapFailureToMessage(message);
    }, (data) {
      _data.value = data;
    });
    _loading.value = false;
  }

  addFavorite() async {
    _loading.value = true;
    await gamesUsecase.addGamesFavorite(data);
    setFavorite(true);
    _loading.value = false;
  }

  deleteFavorite() async {
    _loading.value = true;
    await gamesUsecase.deleteGamesFavorite(data);
    setFavorite(false);
    _loading.value = false;
  }
}
