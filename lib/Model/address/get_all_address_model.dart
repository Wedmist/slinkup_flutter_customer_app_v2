// To parse this JSON data, do
//
//     final getAllAddressModel = getAllAddressModelFromJson(jsonString);

import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) => GetAllAddressModel.fromJson(json.decode(str));

String getAllAddressModelToJson(GetAllAddressModel data) => json.encode(data.toJson());

class GetAllAddressModel {
  int status;
  String message;
  List<AddressModel> data;

  GetAllAddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) => GetAllAddressModel(
        status: json["status"],
        message: json["message"],
        data: List<AddressModel>.from(json["data"].map((x) => AddressModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AddressModel {
  int? addressId;
  int? customerId;
  dynamic addressType;
  String? name;
  int? phoneNumber;
  int? alternatePhoneNumber;
  String? pincode;
  String? state;
  String? city;
  String? houseNumber;
  String? landmark;
  String? activeStatus;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  AddressModel({
    this.addressId,
    this.customerId,
    this.addressType,
    this.name,
    this.phoneNumber,
    this.alternatePhoneNumber,
    this.pincode,
    this.state,
    this.city,
    this.houseNumber,
    this.landmark,
    this.activeStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressId: json["address_id"],
        customerId: json["customer_id"],
        addressType: json["address_type"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        alternatePhoneNumber: json["alternate_phone_number"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        houseNumber: json["house_number"],
        landmark: json["landmark"],
        activeStatus: json["active_status"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "customer_id": customerId,
        "address_type": addressType,
        "name": name,
        "phone_number": phoneNumber,
        "alternate_phone_number": alternatePhoneNumber,
        "pincode": pincode,
        "state": state,
        "city": city,
        "house_number": houseNumber,
        "landmark": landmark,
        "active_status": activeStatus,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
