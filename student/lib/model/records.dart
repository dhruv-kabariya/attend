import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import './record.dart';
import './user.dart';

class Records with ChangeNotifier {
  List<Record> _record = [];

  JsonDecoder _decoder = JsonDecoder();

  Future<void> record(int enrollment_id) async {
    String url = "http://192.168.56.1:8000/api" + "records/";

    Map<String, int> body;
    body["student_id"] = enrollment_id;

    Map<String, String> header = {"Content-type": "application/json"};

    List<dynamic> respo = await http
        .post(url, body: json.encode(body), headers: header)
        .then((http.Response response) {
      final body = response.body;
      final int statusCode = response.statusCode;
      if (statusCode > 400 || statusCode < 200) {
        throw Exception("error records");
      }

      return _decoder.convert(body);
    });

    List<Record> _temp = [];

    for (int i = 0; i < respo.length; i++) {
      _temp.add(Record(
          attend: respo[i]["attend"],
          date: respo[i]["date"],
          sectionId: respo[i]["section_id"]));
    }

    _record = _temp;
    notifyListeners();
  }

  List<Record> get records {
    return _record;
  }
}
