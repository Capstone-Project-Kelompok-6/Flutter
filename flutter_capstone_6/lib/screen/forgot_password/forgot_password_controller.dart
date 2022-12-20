import 'dart:convert';

import 'package:flutter/material.dart';

import '../../component/repository.dart';
import '../../model/user/user_model.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();
  var pinController = TextEditingController();

  Repository _repository = Repository();
  Future<UserModel> changePassword(String email, String confirm_password,
      String password, String pin) async {
    http.Response result = await _repository.forgotPassword(
        emailController.text,
        confirmPassController.text,
        passwordController.text,
        pinController.text);

    Map<String, dynamic> responseBody = jsonDecode(result.body);
    UserModel registerResponse =
        UserModel.fromJson(responseBody, UserModel.fromJson);

    print('Response: ${registerResponse.message}');
    return registerResponse;
  }
}
