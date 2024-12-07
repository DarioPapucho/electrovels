import 'package:electrovels/core/resources/data_state.dart';
import 'package:electrovels/core/usecase/usecase.dart';
import 'package:electrovels/features/auth/data/data_sources/local/dao/cashier_dao.dart';
import 'package:electrovels/features/auth/domain/entities/cashier_entity.dart';

class GetCashierUseCase
    implements UseCase<DataState<List<CashierEntity>>, void> {
  final CashierDao _cashierDao;
  GetCashierUseCase(this._cashierDao);
  @override
  Future<DataState<List<CashierEntity>>> call({void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
