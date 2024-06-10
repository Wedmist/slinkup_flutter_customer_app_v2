// To parse this JSON data, do
//
//     final getsubServiceByUserIdAndServiceIdModel = getsubServiceByUserIdAndServiceIdModelFromJson(jsonString);

import 'dart:convert';

GetsubServiceByUserIdAndServiceIdModel getsubServiceByUserIdAndServiceIdModelFromJson(String str) =>
    GetsubServiceByUserIdAndServiceIdModel.fromJson(json.decode(str));

String getsubServiceByUserIdAndServiceIdModelToJson(GetsubServiceByUserIdAndServiceIdModel data) =>
    json.encode(data.toJson());

class GetsubServiceByUserIdAndServiceIdModel {
  int status;
  String message;
  List<GetSubServiceByServiceIdModel> subServices;

  GetsubServiceByUserIdAndServiceIdModel({
    required this.status,
    required this.message,
    required this.subServices,
  });

  factory GetsubServiceByUserIdAndServiceIdModel.fromJson(Map<String, dynamic> json) =>
      GetsubServiceByUserIdAndServiceIdModel(
        status: json["status"],
        message: json["message"],
        subServices: List<GetSubServiceByServiceIdModel>.from(
            json["sub_services"].map((x) => GetSubServiceByServiceIdModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "sub_services": List<dynamic>.from(subServices.map((x) => x.toJson())),
      };
}

class GetSubServiceByServiceIdModel {
  int? subServiceId;
  String? serviceName;
  String? image;
  int? servicePrice;
  dynamic selectedService;
  String? description;
  dynamic addOnService;
  dynamic moreInformation;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? categoryId;
  int? serviceId;
  int? count;

  GetSubServiceByServiceIdModel({
    this.subServiceId,
    this.serviceName,
    this.image,
    this.servicePrice,
    this.selectedService,
    this.description,
    this.addOnService,
    this.moreInformation,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.categoryId,
    this.serviceId,
    this.count,
  });

  factory GetSubServiceByServiceIdModel.fromJson(Map<String, dynamic> json) => GetSubServiceByServiceIdModel(
        subServiceId: json["sub_service_id"],
        serviceName: json["service_name"],
        image: json["image"],
        servicePrice: json["service_price"],
        selectedService: json["selected_service"],
        description: json["description"],
        addOnService: json["add_on_service"],
        moreInformation: json["more_information"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        categoryId: json["category_id"],
        serviceId: json["service_id"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "sub_service_id": subServiceId,
        "service_name": serviceName,
        "image": image,
        "service_price": servicePrice,
        "selected_service": selectedService,
        "description": description,
        "add_on_service": addOnService,
        "more_information": moreInformation,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "category_id": categoryId,
        "service_id": serviceId,
        "count": count,
      };
}
