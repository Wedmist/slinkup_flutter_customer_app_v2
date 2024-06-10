// To parse this JSON data, do
//
//     final getSubServiceWithProviderDetailsModel = getSubServiceWithProviderDetailsModelFromJson(jsonString);

import 'dart:convert';

GetSubServiceWithProviderDetailsModel getSubServiceWithProviderDetailsModelFromJson(String str) =>
    GetSubServiceWithProviderDetailsModel.fromJson(json.decode(str));

String getSubServiceWithProviderDetailsModelToJson(GetSubServiceWithProviderDetailsModel data) =>
    json.encode(data.toJson());

class GetSubServiceWithProviderDetailsModel {
  int status;
  String message;
  GetServiceUserDataModel data;

  GetSubServiceWithProviderDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetSubServiceWithProviderDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetSubServiceWithProviderDetailsModel(
        status: json["status"],
        message: json["message"],
        data: GetServiceUserDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class GetServiceUserDataModel {
  int? userId;
  dynamic profileImg;
  String? name;
  String? emailId;
  int? mobileNo;
  String? gender;
  String? spokenLanguage;
  int? customerService;
  dynamic locationLat;
  dynamic locationLong;
  dynamic serviceArea;
  List<GetSubServiceModel>? services;

  GetServiceUserDataModel({
    this.userId,
    this.profileImg,
    this.name,
    this.emailId,
    this.mobileNo,
    this.gender,
    this.spokenLanguage,
    this.customerService,
    this.locationLat,
    this.locationLong,
    this.serviceArea,
    this.services,
  });

  factory GetServiceUserDataModel.fromJson(Map<String, dynamic> json) => GetServiceUserDataModel(
        userId: json["user_id"],
        profileImg: json["profile_img"],
        name: json["name"],
        emailId: json["email_id"],
        mobileNo: json["mobile_no"],
        gender: json["gender"],
        spokenLanguage: json["spoken_language"],
        customerService: json["customer_service"],
        locationLat: json["location_lat"],
        locationLong: json["location_long"],
        serviceArea: json["service_area"],
        services: List<GetSubServiceModel>.from(json["services"].map((x) => GetSubServiceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "profile_img": profileImg,
        "name": name,
        "email_id": emailId,
        "mobile_no": mobileNo,
        "gender": gender,
        "spoken_language": spokenLanguage,
        "customer_service": customerService,
        "location_lat": locationLat,
        "location_long": locationLong,
        "service_area": serviceArea,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class GetSubServiceModel {
  int serviceId;
  int userId;
  int categoryId;
  String serviceName;

  GetSubServiceModel({
    required this.serviceId,
    required this.userId,
    required this.categoryId,
    required this.serviceName,
  });

  factory GetSubServiceModel.fromJson(Map<String, dynamic> json) => GetSubServiceModel(
        serviceId: json["service_id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        serviceName: json["service_name"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "user_id": userId,
        "category_id": categoryId,
        "service_name": serviceName,
      };
}
