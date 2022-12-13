import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/repository.dart';
import 'package:flutter_capstone_6/model/user/user_model.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  Repository _repository = Repository();
  Future<UserModel> register() async {
    http.Response result = await _repository.register(
        firstNameController.text,
        lastNameController.text,
        phoneNumberController.text,
        emailController.text,
        passwordController.text);

    Map<String, dynamic> registerBody = jsonDecode(result.body);
    UserModel registerResponse =
        UserModel.fromJson(registerBody, UserModel.fromJson);

    print('Response: ${registerResponse.message}');
    return registerResponse;
  }
}
