import 'package:electrovels/features/auth/data/data_sources/local/dao/cashier_dao.dart';
import 'package:floor/floor.dart';
import '../../../features/auth/data/models/cashier_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import '../../../features/auth/domain/enums/cashier_permission.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [CashierModel])
abstract class AppDatabase extends FloorDatabase {
  CashierDao get cashierDAO;
}
