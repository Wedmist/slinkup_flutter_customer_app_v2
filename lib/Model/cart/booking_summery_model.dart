// To parse this JSON data, do
//
//     final bookingSummeryModel = bookingSummeryModelFromJson(jsonString);

import 'dart:convert';

BookingSummeryModel bookingSummeryModelFromJson(String str) => BookingSummeryModel.fromJson(json.decode(str));

String bookingSummeryModelToJson(BookingSummeryModel data) => json.encode(data.toJson());

class BookingSummeryModel {
  int status;
  String message;
  BookingSummery data;

  BookingSummeryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BookingSummeryModel.fromJson(Map<String, dynamic> json) => BookingSummeryModel(
        status: json["status"],
        message: json["message"],
        data: BookingSummery.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class BookingSummery {
  AddressDatetime addressDatetime;
  List<SubService> subServices;
  List<dynamic> addAddOnServices;
  List<BillingPrice> billingPrice;

  BookingSummery({
    required this.addressDatetime,
    required this.subServices,
    required this.addAddOnServices,
    required this.billingPrice,
  });

  factory BookingSummery.fromJson(Map<String, dynamic> json) => BookingSummery(
        addressDatetime: AddressDatetime.fromJson(json["address_datetime"]),
        subServices: List<SubService>.from(json["sub_services"].map((x) => SubService.fromJson(x))),
        addAddOnServices: List<dynamic>.from(json["add_add_on_services"].map((x) => x)),
        billingPrice: List<BillingPrice>.from(json["billing_price"].map((x) => BillingPrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address_datetime": addressDatetime.toJson(),
        "sub_services": List<dynamic>.from(subServices.map((x) => x.toJson())),
        "add_add_on_services": List<dynamic>.from(addAddOnServices.map((x) => x)),
        "billing_price": List<dynamic>.from(billingPrice.map((x) => x.toJson())),
      };
}

class AddressDatetime {
  String address;
  DateTime dateTime;

  AddressDatetime({
    required this.address,
    required this.dateTime,
  });

  factory AddressDatetime.fromJson(Map<String, dynamic> json) => AddressDatetime(
        address: json["address"],
        dateTime: DateTime.parse(json["date_time"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "date_time": dateTime.toIso8601String(),
      };
}

class BillingPrice {
  String name;
  int quantity;
  int price;

  BillingPrice({
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory BillingPrice.fromJson(Map<String, dynamic> json) => BillingPrice(
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
      };
}

class SubService {
  int subServiceId;
  String serviceName;
  String image;
  int servicePrice;
  String description;
  int serviceId;
  String status;
  int customerUserId;
  int providerUserId;
  int categoryId;
  int cartCount;

  SubService({
    required this.subServiceId,
    required this.serviceName,
    required this.image,
    required this.servicePrice,
    required this.description,
    required this.serviceId,
    required this.status,
    required this.customerUserId,
    required this.providerUserId,
    required this.categoryId,
    required this.cartCount,
  });

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
        subServiceId: json["sub_service_id"],
        serviceName: json["service_name"],
        image: json["image"],
        servicePrice: json["service_price"],
        description: json["description"],
        serviceId: json["service_id"],
        status: json["status"],
        customerUserId: json["customer_user_id"],
        providerUserId: json["provider_user_id"],
        categoryId: json["category_id"],
        cartCount: json["cart_count"],
      );

  Map<String, dynamic> toJson() => {
        "sub_service_id": subServiceId,
        "service_name": serviceName,
        "image": image,
        "service_price": servicePrice,
        "description": description,
        "service_id": serviceId,
        "status": status,
        "customer_user_id": customerUserId,
        "provider_user_id": providerUserId,
        "category_id": categoryId,
        "cart_count": cartCount,
      };
}
