import 'package:floor/floor.dart';
import 'package:electrovels/features/auth/domain/enums/cashier_permission.dart';

class CashierPermissionConverter extends TypeConverter<CashierPermission, int> {
  @override
  CashierPermission decode(int databaseValue) {
    return CashierPermission.values[databaseValue];
  }

  @override
  int encode(CashierPermission value) {
    return value.index;
  }
}
