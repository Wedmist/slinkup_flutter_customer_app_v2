// To parse this JSON data, do
//
//     final getServiceByCategoriesModel = getServiceByCategoriesModelFromJson(jsonString);

import 'dart:convert';

GetServiceByCategoriesModel getServiceByCategoriesModelFromJson(String str) =>
    GetServiceByCategoriesModel.fromJson(json.decode(str));

String getServiceByCategoriesModelToJson(GetServiceByCategoriesModel data) => json.encode(data.toJson());

class GetServiceByCategoriesModel {
  int status;
  String message;
  List<GetServiceByCatIdModel> services;

  GetServiceByCategoriesModel({
    required this.status,
    required this.message,
    required this.services,
  });

  factory GetServiceByCategoriesModel.fromJson(Map<String, dynamic> json) => GetServiceByCategoriesModel(
        status: json["status"],
        message: json["message"],
        services: List<GetServiceByCatIdModel>.from(json["services"].map((x) => GetServiceByCatIdModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class GetServiceByCatIdModel {
  int? serviceId;
  String? serviceName;
  int? categoryId;
  int? display;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userId;
  String? image;

  GetServiceByCatIdModel({
    this.serviceId,
    this.serviceName,
    this.categoryId,
    this.display,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.image,
  });

  factory GetServiceByCatIdModel.fromJson(Map<String, dynamic> json) => GetServiceByCatIdModel(
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        categoryId: json["category_id"],
        display: json["display"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service_name": serviceName,
        "category_id": categoryId,
        "display": display,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "image": image,
      };
}
