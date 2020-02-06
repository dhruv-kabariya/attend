import 'package:flutter/cupertino.dart';
import 'package:student/model/faculty.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'lecture.dart';

class Lectures with ChangeNotifier {
  List<Lecture> _lec;
  JsonDecoder _decoder = JsonDecoder();

  // Lectures({this.enroll});

  Future<void> dashboard(String enroll) async {
    String url = "http://192.168.56.1:8000/api" + "/enrolled/";
    Map<String, String> headers = {"Content-type": "application/json"};

    var body = Map<String, String>();
    body["student_id"] = enroll;

    List<dynamic> res = await http
        .post(url, body: json.encode(body), headers: headers)
        .then((http.Response response) {
      final String body = response.body;
      final int statescode = response.statusCode;
      if (statescode < 200 || statescode > 400) {
        throw Exception("Error");
      }
      return _decoder.convert(body);
    });

    List<Lecture> _temp = [];

    for (int i = 0; i < res.length; i++) {
      _temp.add(Lecture(
          sectionId: res[i]["section_id"]["section_id"],
          code: res[i]["section_id"]["course_id"]["course_code"],
          enrolledDate: res[i]["enrolled_date"],
          faculty: Faculty(
            campus: res[i]["section_id"]["faculty_name"]["campus"],
            email: res[i]["section_id"]["faculty_name"]["email"],
            name: res[i]["section_id"]["faculty_name"]["name"],
            roomNo: res[i]["section_id"]["faculty_name"]["room_no"],
          ),
          name: res[i]["section_id"]["course_id"]["course_name"],
          sectionNO: res[i]["section_no"]));
    }

    _lec = _temp;
    notifyListeners();
  }

  List<Lecture> get lectures {
    return _lec;
  }

  Lecture find(int sectNo) {
    return _lec.firstWhere((lec) => lec.sectionId == sectNo);
  }
}
