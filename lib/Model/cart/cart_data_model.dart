// To parse this JSON data, do
//
//     final cartDataModel = cartDataModelFromJson(jsonString);

import 'dart:convert';

CartDataModel cartDataModelFromJson(String str) => CartDataModel.fromJson(json.decode(str));

String cartDataModelToJson(CartDataModel data) => json.encode(data.toJson());

class CartDataModel {
  int status;
  String message;
  List<CartData> cartData;

  CartDataModel({
    required this.status,
    required this.message,
    required this.cartData,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
        status: json["status"],
        message: json["message"],
        cartData: List<CartData>.from(json["cart_data"].map((x) => CartData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cart_data": List<dynamic>.from(cartData.map((x) => x.toJson())),
      };
}

class CartData {
  int? cartId;
  int? customerUserId;
  String? name;
  int? categoryId;
  String? category;
  List<SubService>? subServices;

  CartData({
    this.cartId,
    this.customerUserId,
    this.name,
    this.categoryId,
    this.category,
    this.subServices,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartId: json["cart_id"],
        customerUserId: json["customer_user_id"],
        name: json["name"],
        categoryId: json["category_id"],
        category: json["category"],
        subServices: List<SubService>.from(json["sub_services"].map((x) => SubService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "customer_user_id": customerUserId,
        "name": name,
        "category_id": categoryId,
        "category": category,
        "sub_services": List<dynamic>.from(subServices!.map((x) => x.toJson())),
      };
}

class SubService {
  int? serviceId;
  String? serviceName;
  int? subServiceId;
  String? subServiceName;
  int? subServicePrice;
  int? count;

  SubService({
    this.serviceId,
    this.serviceName,
    this.subServiceId,
    this.subServiceName,
    this.subServicePrice,
    this.count,
  });

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        subServiceId: json["sub_service_id"],
        subServiceName: json["sub_service_name"],
        subServicePrice: json["sub_service_price"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service_name": serviceName,
        "sub_service_id": subServiceId,
        "sub_service_name": subServiceName,
        "sub_service_price": subServicePrice,
        "count": count,
      };
}
