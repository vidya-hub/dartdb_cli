import 'dart:convert';

import 'package:http/http.dart' as http;
import './hive_service.dart';

class DbService {
  static String baseUrl = 'http://localhost:3000';
  static String userCreateUrl = "$baseUrl/db/register";
  static String userLoginUrl = "$baseUrl/db/login";
  static Future<String> createUser({
    required String userName,
    required String password,
  }) async {
    http.Response response = await http.post(
      Uri.parse(userCreateUrl),
      body: json.encode({
        "userName": userName,
        "password": password,
      }),
    );
    dynamic responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      HiveService.saveDbStorage(
        userName: userName,
        password: password,
      );
    }
    return response.statusCode == 200
        ? "User Created Successfully"
        : responseBody["message"];
  }

  static Future<String> loginUser({
    required String userName,
    required String password,
  }) async {
    http.Response response = await http.post(
      Uri.parse(userLoginUrl),
      body: json.encode({
        "userName": userName,
        "password": password,
      }),
    );
    dynamic responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      HiveService.saveDbStorage(
        userName: userName,
        password: password,
      );
    }

    return response.statusCode == 200
        ? "User Logged In Successfully"
        : responseBody["message"];
  }
}
