import 'package:flutter/cupertino.dart';
import 'package:flutter_capstone_6/model/notification.dart';

class NotificationViewModel with ChangeNotifier {
  List<NotificationClass> _datas = [];
  List<NotificationClass> get getDatas => _datas;

  void addNotif(NotificationClass notip) {
    _datas.add(notip);
    notifyListeners();
  }

  void deleteNotif(int index) {
    _datas.removeAt(index);
    notifyListeners();
  }
}
