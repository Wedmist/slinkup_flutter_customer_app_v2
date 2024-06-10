// To parse this JSON data, do
//
//     final getAllCategoriesModel = getAllCategoriesModelFromJson(jsonString);

import 'dart:convert';

GetAllCategoriesModel getAllCategoriesModelFromJson(String str) => GetAllCategoriesModel.fromJson(json.decode(str));

String getAllCategoriesModelToJson(GetAllCategoriesModel data) => json.encode(data.toJson());

class GetAllCategoriesModel {
  int status;
  String message;
  List<GetAllCatModel> categories;

  GetAllCategoriesModel({
    required this.status,
    required this.message,
    required this.categories,
  });

  factory GetAllCategoriesModel.fromJson(Map<String, dynamic> json) => GetAllCategoriesModel(
        status: json["status"],
        message: json["message"],
        categories: List<GetAllCatModel>.from(json["categories"].map((x) => GetAllCatModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class GetAllCatModel {
  int? workCategoryId;
  String? category;
  int? display;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;

  GetAllCatModel({
    this.workCategoryId,
    this.category,
    this.display,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory GetAllCatModel.fromJson(Map<String, dynamic> json) => GetAllCatModel(
        workCategoryId: json["work_category_id"],
        category: json["category"],
        display: json["display"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "work_category_id": workCategoryId,
        "category": category,
        "display": display,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
      };
}
