import 'package:flutter_capstone_6/model/class_model.dart';

class OtpModel {
  DataModel? data;
  String? message;

  OtpModel({this.data, this.message});

  OtpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
