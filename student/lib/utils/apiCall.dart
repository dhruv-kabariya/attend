import 'dart:convert';

import '../model/user.dart';
import './networkUtils.dart';

class ApiCall {
  NetworkUtils _net = NetworkUtils();

  static final String baseUrl = "http://192.168.1.6:8000/api";
  static final String loginUrl = baseUrl + "/login/";
  static final String dashbodDeatils = baseUrl + "/enrolled/";
  static final String recordDetails = dashbodDeatils + "/record/";

  login(String username, String password) async {
    var body = Map<String, String>();
    body["email"] = username;
    body["password"] = password;

    _net.post(loginUrl, body: json.encode(body)).then((dynamic res) {
      print(res.toString());
      User().save(res);
    });
  }

  dashboard(String username) async {
    print("api");
    String url = baseUrl + dashbodDeatils + username;
    print(url);
    _net.get(url).then((dynamic res) {
      print(res);
      return res;
    });
  }
}
