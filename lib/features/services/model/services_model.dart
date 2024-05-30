import 'package:floor/floor.dart';

@Entity(tableName: 'Service')
class ServiceModel {
  @PrimaryKey(autoGenerate: false)
  int? id = 0;
  String? name = "";
  String? description = "";
  double? price = 0.0;
  int? days = 0;

  ServiceModel({this.id, this.name, this.description, this.price, this.days});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'].toDouble(),
        days: json['days']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['days'] = this.days;
    return data;
  }
}
