import 'package:electrovels/core/resources/data_state.dart';
import 'package:electrovels/features/auth/domain/usecases/get_cashier.dart';
import 'package:electrovels/features/auth/presentation/bloc/cashier/local/cashier_event.dart';
import 'package:electrovels/features/auth/presentation/bloc/cashier/local/cashier_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashiersBloc extends Bloc<CashierEvent, CashierState> {
  final GetCashierUseCase _getCashierUseCase;
  CashiersBloc(this._getCashierUseCase) : super(const CashiersLoading()) {
    on<GetCashiers>(onGetCashiers);
  }

  void onGetCashiers(GetCashiers event, Emitter<CashierState> emit) async {
    final dataState = await _getCashierUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(CashiersDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CashiersError(dataState.error!));
    }
  }
}
