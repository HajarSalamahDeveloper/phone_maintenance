import 'package:dio/dio.dart';
import 'package:phone_maintenance/core/share/app_url.dart';
import 'package:phone_maintenance/features/services/model/services_model.dart';
import 'package:phone_maintenance/features/services/repository/repostary_services_base.dart';

import '../../../../services_network/services.dart';
import '../../../services_network/app_dataBase.dart';

class ServicesRepositoryImp extends ServiceRepository {
  final AppDatabase database;
  final ApiServices apiService = ApiServices();

  ServicesRepositoryImp({
    required this.database,
  });

  @override
  Future<List<ServiceModel>> fetchServices() async {
    try {
      print("d");
      Response response = await apiService.getApi(AppUrl.services);
      print("d2");
      print("Fetched data from API: ${response.data}");

      print("d3");
      final servicesListJson = response.data["data"];
      List<ServiceModel> serviceList = servicesListJson
          .map((serviceJson) => ServiceModel.fromJson(serviceJson))
          .toList();
      print("Parsed service list: $serviceList");

      // Save services locally
      await saveServicesLocally(serviceList);

      return serviceList;
    } catch (e) {
      print("Error fetching services from API: $e");
      // Attempt to fetch from local database on error
      return await getServicesFromLocal();
    }
  }

  @override
  Future<List<ServiceModel>> getServicesFromLocal() async {
    try {
      List<ServiceModel> localServices =
          await database.serviceDao.getAllServices();
      print("Fetched services from local database: $localServices");
      return localServices;
    } catch (e) {
      print("Error fetching services from local database: $e");
      return [];
    }
  }

  @override
  Future<void> saveServicesLocally(List<ServiceModel> services) async {
    try {
      await database.serviceDao.insertServices(services);
      print("Services saved locally");
    } catch (e) {
      print("Error saving services locally: $e");
    }
  }
}
