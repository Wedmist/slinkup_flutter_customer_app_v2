// To parse this JSON data, do
//
//     final getSimilarServiceByIdModel = getSimilarServiceByIdModelFromJson(jsonString);

import 'dart:convert';

GetSimilarServiceByIdModel getSimilarServiceByIdModelFromJson(String str) =>
    GetSimilarServiceByIdModel.fromJson(json.decode(str));

String getSimilarServiceByIdModelToJson(GetSimilarServiceByIdModel data) => json.encode(data.toJson());

class GetSimilarServiceByIdModel {
  int status;
  String message;
  List<GetSimilarService> services;

  GetSimilarServiceByIdModel({
    required this.status,
    required this.message,
    required this.services,
  });

  factory GetSimilarServiceByIdModel.fromJson(Map<String, dynamic> json) => GetSimilarServiceByIdModel(
        status: json["status"],
        message: json["message"],
        services: List<GetSimilarService>.from(json["services"].map((x) => GetSimilarService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class GetSimilarService {
  int? serviceId;
  int? userId;
  int? categoryId;
  String? serviceName;
  List<SubServiceDetail>? subServiceDetails;

  GetSimilarService({
    this.serviceId,
    this.userId,
    this.categoryId,
    this.serviceName,
    this.subServiceDetails,
  });

  factory GetSimilarService.fromJson(Map<String, dynamic> json) => GetSimilarService(
        serviceId: json["service_id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        serviceName: json["service_name"],
        subServiceDetails:
            List<SubServiceDetail>.from(json["sub_service_details"].map((x) => SubServiceDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "user_id": userId,
        "category_id": categoryId,
        "service_name": serviceName,
        "sub_service_details": List<dynamic>.from(subServiceDetails!.map((x) => x.toJson())),
      };
}

class SubServiceDetail {
  int? userId;
  String? name;
  dynamic serviceArea;
  int? maxPrice;
  int? minPrice;

  SubServiceDetail({
    this.userId,
    this.name,
    this.serviceArea,
    this.maxPrice,
    this.minPrice,
  });

  factory SubServiceDetail.fromJson(Map<String, dynamic> json) => SubServiceDetail(
        userId: json["user_id"],
        name: json["name"],
        serviceArea: json["service_area"],
        maxPrice: json["max_price"],
        minPrice: json["min_price"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "service_area": serviceArea,
        "max_price": maxPrice,
        "min_price": minPrice,
      };
}
