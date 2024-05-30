import 'dart:async';

import 'package:floor/floor.dart';
import 'package:phone_maintenance/features/services/model/services_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'local_dataBase/dao_services.dart';

part 'app_dataBase.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ServiceModel])
abstract class AppDatabase extends FloorDatabase {
  ServiceDao get serviceDao;
}
