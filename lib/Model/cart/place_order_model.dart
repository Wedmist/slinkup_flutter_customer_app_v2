// To parse this JSON data, do
//
//     final placeOrderModel = placeOrderModelFromJson(jsonString);

import 'dart:convert';

PlaceOrderModel placeOrderModelFromJson(String str) => PlaceOrderModel.fromJson(json.decode(str));

String placeOrderModelToJson(PlaceOrderModel data) => json.encode(data.toJson());

class PlaceOrderModel {
  int status;
  String message;
  PlaceOrderData data;

  PlaceOrderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) => PlaceOrderModel(
        status: json["status"],
        message: json["message"],
        data: PlaceOrderData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class PlaceOrderData {
  List<OrderDetail> orderDetails;
  List<OrderSubService> subServices;
  List<AddOnService> addOnServices;

  PlaceOrderData({
    required this.orderDetails,
    required this.subServices,
    required this.addOnServices,
  });

  factory PlaceOrderData.fromJson(Map<String, dynamic> json) => PlaceOrderData(
        orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
        subServices: List<OrderSubService>.from(json["sub_services"].map((x) => OrderSubService.fromJson(x))),
        addOnServices: List<AddOnService>.from(json["add_on_services"].map((x) => AddOnService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "sub_services": List<dynamic>.from(subServices.map((x) => x.toJson())),
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
  dynamic userId;
  dynamic categoryId;
  dynamic serviceId;
  dynamic subServiceId;

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
      };
}

class OrderDetail {
  int? orderId;
  String? orderImage;
  int? customerUserId;
  int? providerUserId;
  int? categoryId;
  int? serviceId;
  String? subServiceIds;
  String? addOnServiceIds;
  DateTime? orderDatetime;
  int? totalAmount;
  String? orderStatus;
  String? serviceLocation;
  String? paymentMethod;
  DateTime? createdAt;
  String? customerUserName;
  String? providerUserName;

  OrderDetail({
    this.orderId,
    this.orderImage,
    this.customerUserId,
    this.providerUserId,
    this.categoryId,
    this.serviceId,
    this.subServiceIds,
    this.addOnServiceIds,
    this.orderDatetime,
    this.totalAmount,
    this.orderStatus,
    this.serviceLocation,
    this.paymentMethod,
    this.createdAt,
    this.customerUserName,
    this.providerUserName,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderId: json["order_id"],
        orderImage: json["order_image"],
        customerUserId: json["customer_user_id"],
        providerUserId: json["provider_user_id"],
        categoryId: json["category_id"],
        serviceId: json["service_id"],
        subServiceIds: json["sub_service_ids"],
        addOnServiceIds: json["add_on_service_ids"],
        orderDatetime: DateTime.parse(json["order_datetime"]),
        totalAmount: json["total_amount"],
        orderStatus: json["order_status"],
        serviceLocation: json["service_location"],
        paymentMethod: json["payment_method"],
        createdAt: DateTime.parse(json["created_at"]),
        customerUserName: json["customer_user_name"],
        providerUserName: json["provider_user_name"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_image": orderImage,
        "customer_user_id": customerUserId,
        "provider_user_id": providerUserId,
        "category_id": categoryId,
        "service_id": serviceId,
        "sub_service_ids": subServiceIds,
        "add_on_service_ids": addOnServiceIds,
        "order_datetime": orderDatetime?.toIso8601String(),
        "total_amount": totalAmount,
        "order_status": orderStatus,
        "service_location": serviceLocation,
        "payment_method": paymentMethod,
        "created_at": createdAt?.toIso8601String(),
        "customer_user_name": customerUserName,
        "provider_user_name": providerUserName,
      };
}

class OrderSubService {
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

  OrderSubService({
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

  factory OrderSubService.fromJson(Map<String, dynamic> json) => OrderSubService(
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
