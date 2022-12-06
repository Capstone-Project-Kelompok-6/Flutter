import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_capstone_6/model/class_model.dart';
import 'package:http/http.dart' as http;

class OnlineClassViewModel extends ChangeNotifier {
  List<Rows> _classList = [];

  List<Rows> get classList {
    return [..._classList];
  }

  Future<void> getOnlineClass() async {
    final url = 'https://www.go-rest-api.live/api/v1/classes/online';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImEyMTkwZjE4MTVAYmFuZ2tpdC5hY2FkZW15IiwiZXhwIjoxNjcwMTg5NTAyLCJmdWxsbmFtZSI6IkFyeWEgQmF0YXJhIiwiaXNzIjoiYWx0ZXJyYV9jYXBzdG9uZSIsInJvbGVfaWQiOjMsInVzZXJfaWQiOiIwMjAxNDFhYS0xMzAzLTRkYWQtYTgzNy0xYTYzYjJkNWYyYjMifQ.cBVs52bQcGDfcjwv5909px2oq74HYUQV9sgDs-GpoXY'
      });
      List<Rows> newList = [];

      final responseData = json.decode(response.body) as List<dynamic>;

      for (int i = 0; i < responseData.length; i++) {
        Rows rows = Rows(
          classId: responseData[i]['class_id'],
          createdAt: responseData[i]['created_at'],
          description: responseData[i]['description'],
          price: responseData[i]['price'],
          updatedAt: responseData[i]['updated_at'],
          video: responseData[i]['video'],
          videoName: responseData[i]['video_name'],
          videoTitle: responseData[i]['video_title'],
          workout: responseData[i]['workout'],
        );
        newList.add(rows);
      }
      _classList = newList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
