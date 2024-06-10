// To parse this JSON data, do
//
//     final homeScreenDataModel = homeScreenDataModelFromJson(jsonString);

import 'dart:convert';

HomeScreenDataModel homeScreenDataModelFromJson(String str) => HomeScreenDataModel.fromJson(json.decode(str));

String homeScreenDataModelToJson(HomeScreenDataModel data) => json.encode(data.toJson());

class HomeScreenDataModel {
  int status;
  String message;
  List<HomeScreenListModel> data;

  HomeScreenDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeScreenDataModel.fromJson(Map<String, dynamic> json) => HomeScreenDataModel(
        status: json["status"],
        message: json["message"],
        data: List<HomeScreenListModel>.from(json["data"].map((x) => HomeScreenListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HomeScreenListModel {
  int categoryId;
  String categoryName;
  List<CategoryService> categoryServices;

  HomeScreenListModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryServices,
  });

  factory HomeScreenListModel.fromJson(Map<String, dynamic> json) => HomeScreenListModel(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryServices: List<CategoryService>.from(json["category_services"].map((x) => CategoryService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_services": List<dynamic>.from(categoryServices.map((x) => x.toJson())),
      };
}

class CategoryService {
  int? serviceId;
  String? serviceName;
  int? categoryId;
  int? display;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userId;
  String? image;

  CategoryService({
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

  factory CategoryService.fromJson(Map<String, dynamic> json) => CategoryService(
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
