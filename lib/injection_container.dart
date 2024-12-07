import 'package:dio/dio.dart';
import 'package:electrovels/features/auth/data/data_sources/local/dao/cashier_dao.dart';
import 'package:electrovels/features/auth/domain/usecases/get_cashier.dart';
import 'package:electrovels/features/auth/presentation/bloc/cashier/local/cashier_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/data/db/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database').build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<CashierDao>(database.cashierDAO);
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // UseCases
  sl.registerSingleton<GetCashierUseCase>(GetCashierUseCase(sl()));

  // Blocs
  sl.registerFactory<CashiersBloc>(() => CashiersBloc(sl()));
}
