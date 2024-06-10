import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_customer_app/Apis/api_constants.dart';
import 'package:flutter_customer_app/Model/address/get_all_address_model.dart';
import 'package:flutter_customer_app/Model/cart/booking_summery_model.dart';
import 'package:flutter_customer_app/Model/cart/cart_data_model.dart';
import 'package:flutter_customer_app/Model/cart/place_order_model.dart';
import 'package:flutter_customer_app/Model/get_subservice_by_user_id_service_id.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/add_to_cart_button_model.dart';
import '../Model/get_all_categories_model.dart';
import '../Model/get_services_by_category_model.dart';
import '../Model/get_similar_service_by_id_model.dart';
import '../Model/get_sub_services_provider_detailsa_model.dart';
import '../Model/home_screen_data_model.dart';

class ApiHelpers {
  Future<Map?> getuserPostData(String postUrl, Map<String, dynamic> params) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonResponse;
    var url = apiBaseUrl + postUrl;

    var request = http.Request('POST', Uri.parse(url));
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    };

    request.body = json.encode(params);

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        Map jsonMap = json.decode(jsonResponse);
        if (jsonMap["token"] != null) {
          String token = jsonMap["token"];
          debugPrint("Token $token");
          var userID = jsonMap["user_id"];

          prefs.setString('tokenId', token);
          prefs.setInt("userId", userID);
          prefs.setString("jsonResponse", jsonResponse);
        }
        return jsonMap;
      } else if (response.statusCode == 400) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        Map jsonMap = json.decode(jsonResponse);
        return jsonMap;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// work category by ID
  Future<List<HomeScreenListModel>> fetchHomeScreenData({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      HomeScreenDataModel langModel = HomeScreenDataModel.fromJson(data);
      return langModel.data;
      // languageModel = languageModelListToJson(data as LanguageModelList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// get All category
  Future<List<GetAllCatModel>> fetchAllCategoriesData({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      GetAllCategoriesModel langModel = GetAllCategoriesModel.fromJson(data);
      return langModel.categories;
      // languageModel = languageModelListToJson(data as LanguageModelList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// get All category
  Future<List<GetServiceByCatIdModel>> fetchServicesByCatID({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      GetServiceByCategoriesModel langModel = GetServiceByCategoriesModel.fromJson(data);
      return langModel.services;
      // languageModel = languageModelListToJson(data as LanguageModelList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// get similar services
  Future<List<GetSimilarService>> fetchSimilarServiceID({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      GetSimilarServiceByIdModel langModel = GetSimilarServiceByIdModel.fromJson(data);
      return langModel.services;
      // languageModel = languageModelListToJson(data as LanguageModelList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// get similar services
  Future<GetServiceUserDataModel> fetchSubServiceByUserID({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    debugPrint(token);
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      GetSubServiceWithProviderDetailsModel langModel = GetSubServiceWithProviderDetailsModel.fromJson(data);
      return langModel.data;
      // languageModel = languageModelListToJson(data as LanguageModelList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// get subservice by user id and service id
  Future<List<GetSubServiceByServiceIdModel>> getSubServiceByUserIdAndServiceId(
      String postUrl, Map<String, dynamic> params) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    String jsonResponse;
    var url = apiBaseUrl + postUrl;

    var request = http.Request('POST', Uri.parse(url));
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.body = json.encode(params);

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        var jsonMap = json.decode(jsonResponse);
        GetsubServiceByUserIdAndServiceIdModel model = GetsubServiceByUserIdAndServiceIdModel.fromJson(jsonMap);

        return model.subServices;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  /// get add To Cart Button
  Future<Data> addToCartButton({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      AddToCartPlusButtonModel model = AddToCartPlusButtonModel.fromJson(data);
      var datav = model.data;
      return datav;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  // /// post get add To Cart Button
  // Future<Map> getCartButtons({required String api, required Map<String, dynamic> queryParameters}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('tokenId');
  //   // var url = Uri.parse(apiBaseUrl + api,);
  //   Uri uri = Uri.parse(apiBaseUrl + api).replace(queryParameters: queryParameters);
  //   final response = await http.get(uri, headers: {
  //     'Content-Type': 'application/json',
  //     'Access-Control-Allow-Origin': '*',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception('Unable to fetch products from the REST API');
  //   }
  // }

  ///
  /// get subservice by user id and service id
  Future<Map> postAddToCart(String postUrl, Map<String, dynamic> params) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    String jsonResponse;
    var url = apiBaseUrl + postUrl;

    var request = http.Request('POST', Uri.parse(url));
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.body = json.encode(params);

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        var jsonMap = json.decode(jsonResponse);

        return jsonMap;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return {};
  }

  /// get add_to_cart_minus_button
  Future<List<CartData>> getCartData({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      CartDataModel cartData = CartDataModel.fromJson(data);
      return cartData.cartData;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// get booking summery
  Future<BookingSummeryModel?> postBookingSummery({
    required String postUrl,
    required Map<String, dynamic> params,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    String jsonResponse;
    var url = apiBaseUrl + postUrl;

    var request = http.Request('POST', Uri.parse(url));
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.body = json.encode(params);

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        var jsonMap = json.decode(jsonResponse);
        BookingSummeryModel bookingSummery = BookingSummeryModel.fromJson(jsonMap);
        return bookingSummery;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// get place order summery
  Future<PlaceOrderModel?> placeOrderSummery({
    required String postUrl,
    required Map<String, dynamic> params,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    String jsonResponse;
    var url = apiBaseUrl + postUrl;

    var request = http.Request('POST', Uri.parse(url));
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.body = json.encode(params);

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        var jsonMap = json.decode(jsonResponse);
        PlaceOrderModel orderSummery = PlaceOrderModel.fromJson(jsonMap);
        return orderSummery;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// get All Address

  Future<List<AddressModel>> getAllAddressView({required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + api);
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      GetAllAddressModel langModel = GetAllAddressModel.fromJson(data);
      return langModel.data;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// add a new address

  Future<Map> addNewAddress({required String postUrl, required Map<String, dynamic> params}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    String jsonResponse;
    var url = apiBaseUrl + postUrl;

    var request = http.Request('POST', Uri.parse(url));
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.body = json.encode(params);

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        var jsonMap = json.decode(jsonResponse);

        return jsonMap;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return {};
  }

  Future<Map> updateExistingAddress({required String putUrl, required Map<String, dynamic> params}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + putUrl);
    var bodyData = json.encode(params);
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: bodyData);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// delete sub service by Service id
  Future<Map> deleteAddress({required String deleteUrl}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenId');
    var url = Uri.parse(apiBaseUrl + deleteUrl);
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
      // languageModel = languageModelListToJson(data as LanguageModelList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
