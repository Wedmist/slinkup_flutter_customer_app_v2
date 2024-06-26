import 'dart:convert';

Map<String, List<String>> getPhotosModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x))));

// String getPhotosModelToJson(Map<String, List<String>> data) =>
//     json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))));
