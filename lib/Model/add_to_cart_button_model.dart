// To parse this JSON data, do
//
//     final addToCartPlusButtonModel = addToCartPlusButtonModelFromJson(jsonString);

import 'dart:convert';

AddToCartPlusButtonModel addToCartPlusButtonModelFromJson(String str) =>
    AddToCartPlusButtonModel.fromJson(json.decode(str));

String addToCartPlusButtonModelToJson(AddToCartPlusButtonModel data) => json.encode(data.toJson());

class AddToCartPlusButtonModel {
  int status;
  String message;
  Data data;

  AddToCartPlusButtonModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddToCartPlusButtonModel.fromJson(Map<String, dynamic> json) => AddToCartPlusButtonModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  SubServiceDetails subServiceDetails;
  List<AddOnService> addOnServices;

  Data({
    required this.subServiceDetails,
    required this.addOnServices,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subServiceDetails: SubServiceDetails.fromJson(json["sub_service_details"]),
        addOnServices: List<AddOnService>.from(json["add_on_services"].map((x) => AddOnService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sub_service_details": subServiceDetails.toJson(),
        "add_on_services": List<dynamic>.from(addOnServices.map((x) => x.toJson())),
      };
}

class AddOnService {
  int? addOnServiceId;
  String? addOnServiceName;
  int? addOnServicePrice;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;

  int? categoryId;
  int? serviceId;
  int? subServiceId;
  bool? isSelected;

  AddOnService({
    this.addOnServiceId,
    this.addOnServiceName,
    this.addOnServicePrice,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.categoryId,
    this.serviceId,
    this.subServiceId,
    this.isSelected,
  });

  factory AddOnService.fromJson(Map<String, dynamic> json) => AddOnService(
        addOnServiceId: json["add_on_service_id"],
        addOnServiceName: json["add_on_service_name"],
        addOnServicePrice: json["add_on_service_price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        categoryId: json["category_id"],
        serviceId: json["service_id"],
        subServiceId: json["sub_service_id"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "add_on_service_id": addOnServiceId,
        "add_on_service_name": addOnServiceName,
        "add_on_service_price": addOnServicePrice,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "category_id": categoryId,
        "service_id": serviceId,
        "sub_service_id": subServiceId,
        "isSelected": isSelected,
      };
}

class SubServiceDetails {
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

  SubServiceDetails({
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
  });

  factory SubServiceDetails.fromJson(Map<String, dynamic> json) => SubServiceDetails(
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
      };
}
