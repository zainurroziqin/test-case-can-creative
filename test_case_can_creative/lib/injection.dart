import 'package:get_it/get_it.dart';
import 'package:test_case_can_creative/data/repo/games_repo_impl.dart';
import 'package:test_case_can_creative/data/source/local/app_database.dart';
import 'package:test_case_can_creative/data/source/remote/source_game.dart';
import 'package:test_case_can_creative/domain/repo/games_repo.dart';
import 'package:test_case_can_creative/domain/usecase/games_usecase.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init(AppDatabase database) async {
  // external
  sl.registerFactory(
    () => http.Client(),
  );

  

  sl.registerSingleton<AppDatabase>(database);
  // final database =
  //     await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  // sl.registerSingleton<AppDatabase>(database);
// data layer
  sl.registerFactory<SourceGame>(
    () => SourceGameImpl(client: sl()),
  );
  sl.registerFactory<GamesRepo>(
    () => GamesRepoImpl(sourceGame: sl(), appDatabase: sl()),
  );
// domain layer
  sl.registerFactory(
    () => GamesUsecase(gamesRepo: sl()),
  );
// application layer
  // sl.registerFactory(
  //   () => ControllerHome(gamesUsecase: sl()),
  // );
}
