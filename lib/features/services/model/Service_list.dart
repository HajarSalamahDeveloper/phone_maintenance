import 'package:phone_maintenance/features/services/model/services_model.dart';

class ServiceListModel {
  final int code;
  final String message;
  final List<ServiceModel> data;

  ServiceListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ServiceListModel.fromJson(Map<String, dynamic> json) {
    return ServiceListModel(
      code: json['code'],
      message: json['1'],
      data: (json['data'] as List)
          .map((serviceJson) => ServiceModel.fromJson(serviceJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.map((service) => service.toJson()).toList(),
    };
  }
}
