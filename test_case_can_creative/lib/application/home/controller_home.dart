import 'package:get/get.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';
import 'package:test_case_can_creative/domain/usecase/games_usecase.dart';
import 'package:test_case_can_creative/utils/failure_message.dart';

class ControllerHome extends GetxController {
  GamesUsecase gamesUsecase;
  ControllerHome({required this.gamesUsecase});

  final _isError = false.obs;
  bool get isError => _isError.value;

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _loadinglast = false.obs;
  bool get loadinglast => _loadinglast.value;

  final _loadingSearch = false.obs;
  bool get loadingSearch => _loadingSearch.value;

  final _listGames = <GamesEntity>[].obs;
  // ignore: invalid_use_of_protected_member
  List<GamesEntity> get listGames => _listGames.value;

  final _message = "".obs;
  String get message => _message.value;

  int page = 1;

  List<GamesEntity> listtmp = [];
  List<GamesEntity> list = [];

  getGames() async {
    if (page == 1) {
      _loading.value = true;
    }
    final result = await gamesUsecase.getGames(page, 10);
    result.fold((messagetmp) {
      _message.value = FailureMessage.mapFailureToMessage(messagetmp);
      _isError.value = true;
    }, (data) {
      list.addAll(data);
      _listGames.value = list;
      page++;
      _loadinglast.value = true;
    });
    _loading.value = false;
    _loadinglast.value = false;
  }


}
