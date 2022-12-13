import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/model/class_offline/class_offline_outer.dart';
import 'package:flutter_capstone_6/model/class_offline/class_offline_rows.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BookingOfflineController {
  ClassOfflineOuter? classOfflineOuter;
  List<ClassOfflineRows>? classOfflineRows;
  ClassOfflineRows? classDetail;

  Future getOfflineClass(BuildContext context, String token) async {
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-type': 'application/json'
    };

    try {
      http.Response response = await http.get(
          Uri.parse('https://www.go-rest-api.live/api/v1/classes/offline'),
          headers: headers);

      if (response.statusCode == 200) {
        print('JSON Response: ${response.body}');

        Map<String, dynamic> classBody = jsonDecode(response.body);
        classOfflineOuter = ClassOfflineOuter.fromJson(classBody);
        classOfflineRows = classOfflineOuter!.data.rows;

        // print(classOfflineOuter!.data.page);
        // print(classOfflineRows!.first.workout);

        // State Management
        final data = Provider.of<OfflineClassViewModel>(context, listen: false);

        for (int i = 0; i < classOfflineRows!.length; i++) {
          classDetail = ClassOfflineRows(
            classId: classOfflineRows![i].classId,
            workoutId: classOfflineRows![i].workoutId,
            workout: classOfflineRows![i].workout,
            workoutImage: classOfflineRows![i].workoutImage,
            instructorId: classOfflineRows![i].instructorId,
            instructorName: classOfflineRows![i].instructorName,
            instructorImage: classOfflineRows![i].instructorImage,
            classDates: classOfflineRows![i].classDates,
            price: classOfflineRows![i].price,
            description: classOfflineRows![i].description,
          );
          data.addUser(classDetail!);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
