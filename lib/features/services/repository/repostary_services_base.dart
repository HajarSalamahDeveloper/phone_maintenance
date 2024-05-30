import 'package:phone_maintenance/features/services/model/services_model.dart';

abstract class ServiceRepository {
  Future<List<ServiceModel>> fetchServices();
  Future<List<ServiceModel>> getServicesFromLocal();
  Future<void> saveServicesLocally(List<ServiceModel> services);
}
