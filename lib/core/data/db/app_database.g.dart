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

  CashierDao? _cashierDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `cashiers` (`id` INTEGER, `username` TEXT, `permission` INTEGER, `password` TEXT, `fullName` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CashierDao get cashierDAO {
    return _cashierDAOInstance ??= _$CashierDao(database, changeListener);
  }
}

class _$CashierDao extends CashierDao {
  _$CashierDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cashierModelInsertionAdapter = InsertionAdapter(
            database,
            'cashiers',
            (CashierModel item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'permission': item.permission?.index,
                  'password': item.password,
                  'fullName': item.fullName
                }),
        _cashierModelDeletionAdapter = DeletionAdapter(
            database,
            'cashiers',
            ['id'],
            (CashierModel item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'permission': item.permission?.index,
                  'password': item.password,
                  'fullName': item.fullName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CashierModel> _cashierModelInsertionAdapter;

  final DeletionAdapter<CashierModel> _cashierModelDeletionAdapter;

  @override
  Future<CashierModel?> getByUsername(String username) async {
    return _queryAdapter.query('SELECT * FROM cashiers WHERE username = ?1',
        mapper: (Map<String, Object?> row) => CashierModel(
            id: row['id'] as int?,
            username: row['username'] as String?,
            permission: row['permission'] == null
                ? null
                : CashierPermission.values[row['permission'] as int],
            password: row['password'] as String?,
            fullName: row['fullName'] as String?),
        arguments: [username]);
  }

  @override
  Future<void> insertCashier(CashierModel cashier) async {
    await _cashierModelInsertionAdapter.insert(
        cashier, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCashier(CashierModel cashier) async {
    await _cashierModelDeletionAdapter.delete(cashier);
  }
}
