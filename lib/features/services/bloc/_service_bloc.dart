import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_maintenance/features/services/model/services_model.dart';
import 'package:phone_maintenance/features/services/repository/repositry_services.dart';

part '_service_event.dart';
part '_service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServicesRepositoryImp repository;

  ServiceBloc({required this.repository}) : super(ServiceInitial()) {
    on<FetchServices>((event, emit) async {
      emit(ServiceLoading());
      try {
        final services = await repository.fetchServices();
        await repository.saveServicesLocally(services);
        emit(ServiceLoaded(services: services));
      } catch (e) {
        final localServices = await repository.getServicesFromLocal();
        if (localServices.isNotEmpty) {
          emit(ServiceLoaded(services: localServices));
        } else {
          emit(ServiceError(message: e.toString()));
        }
      }
    });
  }
}
