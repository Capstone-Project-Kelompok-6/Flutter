import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_capstone_6/component/repository.dart';
import 'package:flutter_capstone_6/model/user_model.dart';
import 'package:flutter_capstone_6/model/user_token.dart';
import 'package:http/http.dart' as http;

class ProfileProvider extends ChangeNotifier {
  Future<void> getProfile(String fullname) async {
    final url = 'https://www.go-rest-api.live/api/v1/auth/login';

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization':
                'capstoneIb1eP7LctQNIjsbg9J4mzvHll6ap9RtIOCqkaEBHiD60ev0upL9DRp0JDUKEmVfWSiMcZqoUElLfwst4wPQrUAvxvCbeRvt9oNvjkrGSFs3ObOdGSCnwH'
          },
          body: jsonEncode(<String, String>{'fullname': fullname}));

      // final responseData = json.decode(response.body);

      // UserToken user = UserToken(
      //   full_name: responseData['full_name'],
      //   user_id: responseData['user_id'],
      //   phone_number: responseData['phone_number'],
      //   email: responseData['email'],
      //   access_token: responseData['access_token'],
      //   refresh_token: responseData['refresh_token'],
      // );

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
