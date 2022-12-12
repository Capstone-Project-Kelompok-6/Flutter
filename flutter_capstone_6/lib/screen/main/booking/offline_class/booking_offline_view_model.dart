import 'package:flutter/cupertino.dart';
import 'package:flutter_capstone_6/model/class_offline_rows.dart';

class OfflineClassViewModel with ChangeNotifier {
  List<ClassOfflineRows> _datas = [];
  List<ClassOfflineRows> get getDatas => _datas;
  List<String> schedule = [];

  void addUser(ClassOfflineRows classData) {
    _datas.add(classData);
    for (var item in _datas) {
      print(item.classDates);
    }
    notifyListeners();
  }

  void deleteUser(int index) {
    _datas.removeAt(index);
    notifyListeners();
  }

  void deleteAll() {
    _datas.clear();
  }
}
