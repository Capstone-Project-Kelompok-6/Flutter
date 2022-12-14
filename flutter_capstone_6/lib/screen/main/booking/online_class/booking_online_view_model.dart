import 'package:flutter/cupertino.dart';
import 'package:flutter_capstone_6/model/class_online/class_online_rows.dart';

class OnlineClassViewModel with ChangeNotifier {
  List<ClassOnlineRows> _datas = [];
  List<ClassOnlineRows> get getDatas => _datas;

  void addUser(ClassOnlineRows classData) {
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
