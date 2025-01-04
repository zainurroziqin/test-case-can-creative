import 'package:get/get.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:test_case_can_creative/domain/usecase/games_usecase.dart';

class ControllerFavorite extends GetxController {
  final GamesUsecase gamesUsecase;
  ControllerFavorite({required this.gamesUsecase});

  final _isError = false.obs;
  bool get isError => _isError.value;

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listGames = <GamesEntity>[].obs;
  // ignore: invalid_use_of_protected_member
  List<GamesEntity> get listGames => _listGames.value;

  final _message = "".obs;
  String get message => _message.value;

  getListGamesFavorite() async {
    _loading.value = true;
    _listGames.value = await gamesUsecase.getListGamesFavorite();
    _loading.value = false;
  }
}
