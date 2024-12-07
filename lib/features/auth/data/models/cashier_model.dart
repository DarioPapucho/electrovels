import 'package:electrovels/features/auth/domain/entities/cashier_entity.dart';
import 'package:electrovels/features/auth/domain/enums/cashier_permission.dart';
import 'package:floor/floor.dart';
import '../../../../core/utils/type_converter.dart';

@Entity(tableName: 'cashiers', primaryKeys: ['id'])
class CashierModel extends CashierEntity {
  CashierModel(
      {int? id,
      String? username,
      @TypeConverters([CashierPermissionConverter])
      CashierPermission? permission,
      String? password,
      String? fullName})
      : super(
            id: id,
            username: username,
            permission: permission,
            password: password,
            fullName: fullName);
}
