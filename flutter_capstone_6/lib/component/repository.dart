import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Repository {
  Future<http.Response> login(String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'capstoneIb1eP7LctQNIjsbg9J4mzvHll6ap9RtIOCqkaEBHiD60ev0upL9DRp0JDUKEmVfWSiMcZqoUElLfwst4wPQrUAvxvCbeRvt9oNvjkrGSFs3ObOdGSCnwH'
      };
      var request = await http.post(
        Uri.parse('https://www.go-rest-api.live/api/v1/auth/login'),
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
      String phoneNumber, String email, String password) {
    return http.post(
        Uri.parse('https://www.go-rest-api.live/api/v1/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'capstoneIb1eP7LctQNIjsbg9J4mzvHll6ap9RtIOCqkaEBHiD60ev0upL9DRp0JDUKEmVfWSiMcZqoUElLfwst4wPQrUAvxvCbeRvt9oNvjkrGSFs3ObOdGSCnwH'
        },
        body: jsonEncode(<String, String>{
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
          'email': email,
          'password': password
        }));
  }

  Future<http.Response> sendOtp(String email) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = await http.post(
        Uri.parse('https://www.go-rest-api.live/api/v1/auth/otp'),
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
        Uri.parse('https://www.go-rest-api.live/api/v1/auth/otp'),
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
