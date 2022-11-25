import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_capstone_6/component/repository.dart';
import 'package:flutter_capstone_6/model/user_data.dart';
import 'package:flutter_capstone_6/model/user_token.dart';

import 'package:http/http.dart' as http;

import '../../model/user_model.dart';

class LoginController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Repository _repository = Repository();

  Future<UserModel> login() async {
    http.Response result =
        await _repository.login(emailController.text, passwordController.text);

    if (result.statusCode == 200) {
      Map<String, dynamic> loginBody = jsonDecode(result.body);
      UserModel<UserToken> loginResponse =
          UserModel.fromJson(loginBody, UserToken.fromJson);

      debugPrint('Response = ${loginResponse.message}');

      return loginResponse;
    } else {
      UserModel response = UserModel();
      return UserModel(message: 'Invalid email or password');
    }
  }

  Future<UserData> getUser() async {
    http.Response result =
        await _repository.login(emailController.text, passwordController.text);

    if (result.statusCode == 200) {
      Map<String, dynamic> loginBody = jsonDecode(result.body);
      UserData userData = UserData.fromJson(loginBody);

      print('JSON Response: ${result.body}');
      // print('user fullname: ${userData.data.fullName}');

      return userData;
    } else {
      return UserData(
        data: UserToken(
          userId: '',
          fullName: '',
          email: '',
          phoneNumber: '',
          accessToken: '',
          refreshToken: '',
        ),
      );
    }
  }
}
