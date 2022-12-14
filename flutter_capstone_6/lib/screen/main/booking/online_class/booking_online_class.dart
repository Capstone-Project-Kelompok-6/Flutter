import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BookingOnlineClass extends StatefulWidget {
  const BookingOnlineClass({Key? key}) : super(key: key);

  @override
  State<BookingOnlineClass> createState() => _BookingOnlineClassState();
}

class _BookingOnlineClassState extends State<BookingOnlineClass> {
  @override
  void initState() {
    super.initState();
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;
    getOfflineClass(context, userToken);
  }

  Future getOfflineClass(BuildContext context, String token) async {
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-type': 'application/json'
    };

    try {
      http.Response response = await http.get(
          Uri.parse('https://www.go-rest-api.live/api/v1/classes/online'),
          headers: headers);

      if (response.statusCode == 200) {
        print('JSON Response: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Online Class'),
    );
  }
}
