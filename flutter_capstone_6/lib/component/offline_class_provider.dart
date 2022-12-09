import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_capstone_6/model/class_model.dart';
import 'package:http/http.dart' as http;

class OfflineClassProvider extends ChangeNotifier {
  List<RowsModel> _classList = [];
  List<RowsModel> get classList {
    return [..._classList];
  }

  Future getOfflineClass(String token) async {
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    };
    try {
      var response = await http.get(
          Uri.parse('https://www.go-rest-api.live/api/v1/classes/offline'),
          headers: headers);
      List<RowsModel> newList = [];
      final responseData = jsonDecode(response.body) as List<dynamic>;
      for (int i = 0; i < responseData.length; i++) {
        RowsModel classRows = RowsModel(
          class_id: responseData[i]['class_id'],
          created_at: responseData[i]['created_at'],
          description: responseData[i]['description'],
          price: responseData[i]['price'],
          updated_at: responseData[i]['updated_at'],
          video: responseData[i]['video'],
          video_name: responseData[i]['video_name'],
          video_title: responseData[i]['video_title'],
          workout: responseData[i]['workout'],
        );
        newList.add(classRows);
      }
      _classList = newList;
      print(token);
      print(newList);
      print('test = ${responseData}');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
