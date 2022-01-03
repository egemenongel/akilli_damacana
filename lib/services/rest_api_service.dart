import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:akilli_damacana/core/constants/api_constants.dart';
import 'package:akilli_damacana/features/home/cart/model/cart_model.dart';
import 'package:akilli_damacana/features/home/home_view/model/products_list_model.dart';
import 'package:akilli_damacana/features/auth/login/model/login_response_model.dart';
import 'package:akilli_damacana/features/home/profile/model/profile_model.dart';
import 'package:akilli_damacana/services/shared_preferences.dart';

import 'package:http/http.dart' as http;

class RestApiService {
  final sharedService = SharedPreferencesService();

  Future login(String email, String password) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: header,
      body: json.encode(
        {"email": email, "password": password},
      ),
    );

    if (response.statusCode == 200) {
      final userModel = userModelFromJson(response.body);

      sharedService.setToken(userModel.data.token);
      log(userModel.data.token);
      return userModel;
    } else {
      return response.statusCode;
    }
  }

  Future fetchProducts() async {
    try {
      final String token = await sharedService.getToken();
      final Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer " + token.toString()
      };

      final response = await http.get(
        Uri.parse(ApiConstants.productsList),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var productList = productModelFromJson(response.body);

        return productList;
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      HttpException("$e");
    }
  }

  Future createOrder(CartModel cart) async {
    try {
      final String token = await sharedService.getToken();
      final Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token.toString(),
      };

      final response = await http.post(
        Uri.parse(ApiConstants.orderCreate),
        headers: headers,
        body: jsonEncode(cart),
      );

      if (response.statusCode == 200) {
        log(response.body);
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      HttpException("$e");
    }
  }

  Future fetchProfile() async {
    try {
      final String token = await sharedService.getToken();
      final Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer " + token.toString()
      };

      final response = await http.get(
        Uri.parse(ApiConstants.profile),
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body);
        return profileModelFromJson(response.body);
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      HttpException("$e");
    }
  }

  Future updateProfile(UserProfile profile) async {
    try {
      final String token = await sharedService.getToken();
      final Map<String, String> headers = {
        "Accept": "*/*",
        "Authorization": "Bearer " + token.toString(),
        "Content-Type": "application/json"
      };

      final response = await http.put(
        Uri.parse(ApiConstants.profile),
        headers: headers,
        body: json.encode(
          {
            "height": profile.height,
            "weight": profile.weight,
            "age": profile.age,
          },
        ),
      );

      if (response.statusCode == 200) {
        log(response.body);
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      HttpException("$e");
    }
  }
}
