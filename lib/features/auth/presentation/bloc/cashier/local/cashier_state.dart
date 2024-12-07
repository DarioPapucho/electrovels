import 'package:dio/dio.dart';
import 'package:electrovels/features/auth/domain/entities/cashier_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CashierState extends Equatable {
  final List<CashierEntity>? cashiers;
  final DioException? exception;
  const CashierState({this.cashiers, this.exception});
  @override
  List<Object?> get props => [cashiers!, exception!];
}

class CashiersLoading extends CashierState {
  const CashiersLoading();
}

class CashiersDone extends CashierState {
  const CashiersDone(List<CashierEntity> cashiers) : super(cashiers: cashiers);
}

class CashiersError extends CashierState {
  const CashiersError(DioException exception) : super(exception: exception);
}
