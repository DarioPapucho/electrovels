import 'package:electrovels/features/auth/domain/enums/cashier_permission.dart';
import 'package:equatable/equatable.dart';

class CashierEntity extends Equatable {
  final int? id;
  final String? username;
  final CashierPermission? permission;
  final String? password;
  final String? fullName;

  const CashierEntity(
      {this.id, this.username, this.permission, this.password, this.fullName});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
