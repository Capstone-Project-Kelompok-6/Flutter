import 'package:flutter/cupertino.dart';
import 'package:flutter_capstone_6/model/user/user_data.dart';

class LoginViewModel with ChangeNotifier {
  List<UserData> _datas = [];
  List<UserData> get getDatas => _datas;

  void addUser(UserData userData) {
    _datas.add(userData);
    notifyListeners();
  }

  void deleteUser(int index) {
    _datas.removeAt(index);
    notifyListeners();
  }
}
