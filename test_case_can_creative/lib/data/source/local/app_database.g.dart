// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GamesDao? _gamesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `games` (`id` INTEGER, `name` TEXT, `released` TEXT, `imgUrl` TEXT, `rating` REAL, `publish` TEXT, `playing` INTEGER, `desc` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GamesDao get gamesDao {
    return _gamesDaoInstance ??= _$GamesDao(database, changeListener);
  }
}

class _$GamesDao extends GamesDao {
  _$GamesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gamesFavoriteModelInsertionAdapter = InsertionAdapter(
            database,
            'games',
            (GamesFavoriteModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'released': item.released,
                  'imgUrl': item.imgUrl,
                  'rating': item.rating,
                  'publish': item.publish,
                  'playing': item.playing,
                  'desc': item.desc
                }),
        _gamesFavoriteModelDeletionAdapter = DeletionAdapter(
            database,
            'games',
            ['id'],
            (GamesFavoriteModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'released': item.released,
                  'imgUrl': item.imgUrl,
                  'rating': item.rating,
                  'publish': item.publish,
                  'playing': item.playing,
                  'desc': item.desc
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GamesFavoriteModel>
      _gamesFavoriteModelInsertionAdapter;

  final DeletionAdapter<GamesFavoriteModel> _gamesFavoriteModelDeletionAdapter;

  @override
  Future<List<GamesFavoriteModel>> getListGamesFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM games',
        mapper: (Map<String, Object?> row) => GamesFavoriteModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            released: row['released'] as String?,
            imgUrl: row['imgUrl'] as String?,
            rating: row['rating'] as double?,
            publish: row['publish'] as String?,
            playing: row['playing'] as int?,
            desc: row['desc'] as String?));
  }

  @override
  Future<void> insertGames(GamesFavoriteModel gamesFavoriteModel) async {
    await _gamesFavoriteModelInsertionAdapter.insert(
        gamesFavoriteModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGames(GamesFavoriteModel gamesFavoriteModel) async {
    await _gamesFavoriteModelDeletionAdapter.delete(gamesFavoriteModel);
  }
}
