import 'package:floor/floor.dart';
import 'package:phone_maintenance/features/services/model/services_model.dart';

@dao
abstract class ServiceDao {
  @Query('SELECT * FROM Service')
  Future<List<ServiceModel>> getAllServices();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertServices(List<ServiceModel> services);
}
