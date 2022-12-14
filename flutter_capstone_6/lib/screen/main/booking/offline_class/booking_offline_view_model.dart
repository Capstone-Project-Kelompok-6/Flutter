import 'package:flutter/cupertino.dart';
import 'package:flutter_capstone_6/model/class_offline/class_offline_rows.dart';

class OfflineClassViewModel with ChangeNotifier {
  List<ClassOfflineRows> _datas = [];
  List<ClassOfflineRows> get getDatas => _datas;

  void addUser(ClassOfflineRows classData) {
    _datas.add(classData);
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
