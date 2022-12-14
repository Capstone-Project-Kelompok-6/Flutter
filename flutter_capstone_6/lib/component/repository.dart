import 'dart:async';
import 'dart:convert';
import 'package:flutter_capstone_6/component/api.dart';
import 'package:http/http.dart' as http;

class Repository {
  ApiEndpoint api = ApiEndpoint();
  Future<http.Response> login(String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': api.ApiKey
      };
      var request = await http.post(
        Uri.parse(api.BASE_URL + 'auth/login'),
        body: {"email": email, 'password': password},
      );

      request.headers.addAll(headers);
      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<http.Response> register(String first_name, String last_name,
      String phone_number, String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': api.ApiKey
      };
      var request = await http.post(Uri.parse(api.BASE_URL + 'auth/register'),
          body: jsonEncode({
            "first_name": first_name,
            'last_name': last_name,
            'phone_number': phone_number,
            'email': email,
            'password': password
          }),
          headers: headers);
      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
    ;
  }

  Future<http.Response> sendOtp(String email) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = await http.post(
        Uri.parse('${api.BASE_URL}auth/otp'),
        body: {"email": email},
      );

      request.headers.addAll(headers);

      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> verifyOtp(String email, String otp) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = await http.patch(
        Uri.parse('${api.BASE_URL}auth/otp'),
        body: {"email": email, "otp": otp},
      );

      request.headers.addAll(headers);

      if (request.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }
}
