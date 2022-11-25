import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {
  Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse('https://www.go-rest-api.live/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'capstoneIb1eP7LctQNIjsbg9J4mzvHll6ap9RtIOCqkaEBHiD60ev0upL9DRp0JDUKEmVfWSiMcZqoUElLfwst4wPQrUAvxvCbeRvt9oNvjkrGSFs3ObOdGSCnwH'
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
  }

  Future<http.Response> register(String first_name, String last_name,
      String phone_number, String email, String password) {
    return http.post(
        Uri.parse('https://www.go-rest-api.live/api/v1/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'capstoneIb1eP7LctQNIjsbg9J4mzvHll6ap9RtIOCqkaEBHiD60ev0upL9DRp0JDUKEmVfWSiMcZqoUElLfwst4wPQrUAvxvCbeRvt9oNvjkrGSFs3ObOdGSCnwH'
        },
        body: jsonEncode(<String, String>{
          'first_name': first_name,
          'last_name': last_name,
          'phone_number': phone_number,
          'email': email,
          'password': password
        }));
  }
}
