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

  Future<http.Response> register(String firstName, String lastName,
      String phoneNumber, String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': api.ApiKey
      };
      var request = await http.post(Uri.parse(api.BASE_URL + 'auth/register'),
          body: jsonEncode({
            "first_name": firstName,
            'last_name': lastName,
            'phone_number': phoneNumber,
            'email': email,
            'password': password
          }),
          headers: headers);
      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
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

  Future<http.Response> forgotPassword(String email, String password,
      String confirm_password, String otp) async {
    print(confirm_password);
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      print(
        {
          "email": email,
          'password': password,
          'confirm_password': confirm_password,
          'otp': otp
        },
      );
      var request = await http.patch(
        Uri.parse('https://www.go-rest-api.live/api/v1/auth/forgot-password'),
        body: {
          "email": email,
          'password': password,
          'ConfirmPassword': confirm_password,
          'otp': otp
        },
      );

      request.headers.addAll(headers);
      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
