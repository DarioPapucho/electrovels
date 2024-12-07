import 'package:electrovels/features/auth/data/models/cashier_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class CashierDao {
  @Insert()
  Future<void> insertCashier(CashierModel cashier);

  @delete
  Future<void> deleteCashier(CashierModel cashier);

  @Query('SELECT * FROM cashiers WHERE username = :username')
  Future<CashierModel?> getByUsername(String username);
}
