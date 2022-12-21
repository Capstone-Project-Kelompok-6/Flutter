import 'package:flutter/cupertino.dart';
import 'package:flutter_capstone_6/model/image_profile.dart';

class ImageProfileViewModel with ChangeNotifier {
  List<ImageProfile> _datas = [];
  List<ImageProfile> get getDatas => _datas;

  void addImage(ImageProfile image) {
    _datas.add(image);
    notifyListeners();
  }

  void deleteNotif(int index) {
    _datas.removeAt(index);
    notifyListeners();
  }
}
