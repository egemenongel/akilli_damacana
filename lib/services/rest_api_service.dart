import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:akilli_damacana/core/constants/api_constants.dart';
import 'package:akilli_damacana/features/home/home_view/products_list_model.dart';
import 'package:akilli_damacana/features/home/profile/model/profile_model.dart';
import 'package:akilli_damacana/features/auth/login/model/login_response_model.dart';
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
      print(userModel.data.token);
      return userModel;
    } else {
      return response.statusCode;
    }
  }
}
