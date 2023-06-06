import 'dart:convert';

import 'package:cttns/models/login_user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  var client = http.Client();

  Future<WPUser?> login(LoginUser user,
      {Function(Map<String, dynamic>)? onError}) async {
    var response = await http.post(
        Uri.parse("http://192.168.1.7:8088/cttns/wp-json/jwt-auth/v1/token"),
        body: user.toJson());
    Map<String, dynamic> data = json.decode(response.body);
    if (data["success"]) {
      WPUser wpUser = WPUser.fromJson(data["data"]);
      return wpUser;
    } else {
      onError!(data);
    }
    return null;
  }
}
