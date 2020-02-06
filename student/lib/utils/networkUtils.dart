import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static NetworkUtils _instance = NetworkUtils.internal();
  NetworkUtils.internal();
  factory NetworkUtils() => _instance;

  final JsonDecoder _decoder = JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map header, body, encoding}) {
    Map<String, String> headers = {"Content-type": "application/json"};

    return http
        .post(url, body: body, headers: headers)
        .then((http.Response responce) {
      print(responce.toString());
      final String res = responce.body;
      final statusCode = responce.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}
