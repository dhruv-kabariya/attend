import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import './record.dart';

class Records with ChangeNotifier {
  static List<Record> _record = [];

  JsonDecoder _decoder = JsonDecoder();

  Future<void> record(int enrollmentId) async {
    String url = "http://192.168.1.6:8000/api" + "/records/";

    var body = Map<String, int>();
    body["student_id"] = enrollmentId;

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

  List<Record> course(int sectionId) {
    List<Record> _temp = [];

    for (int i = 0; i < _record.length; i++) {
      if (_record[i].sectionId == sectionId) {
        _temp.add(_record[i]);
      }
    }

    return _temp;
  }

  void adding(bool attend, String date, int sectionId) {
    _record.add(Record(attend: attend, date: date, sectionId: sectionId));
    notifyListeners();
  }
}
