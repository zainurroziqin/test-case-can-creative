import 'package:get/get.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:test_case_can_creative/domain/usecase/games_usecase.dart';
import 'package:test_case_can_creative/utils/failure_message.dart';

class ControllerSearch extends GetxController {
  GamesUsecase gamesUsecase;
  ControllerSearch({required this.gamesUsecase});

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _message = "".obs;
  String get message => _message.value;

  final _isError = false.obs;
  bool get isError => _isError.value;

  final _listGames = <GamesEntity>[].obs;
  // ignore: invalid_use_of_protected_member
  List<GamesEntity> get listGames => _listGames.value;

  searchGame(String name) async {
    _loading.value = true;
    final result = await gamesUsecase.searchGames(name);
    result.fold((message) {
      _message.value = FailureMessage.mapFailureToMessage(message);
    }, (data) {
      _listGames.value = data;
    });
    _loading.value = false;
  }
}
