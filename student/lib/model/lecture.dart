import 'package:flutter/cupertino.dart';

import 'faculty.dart';

class Lecture with ChangeNotifier {
  String enrolledDate;
  int sectionNo;
  Faculty facultyDetais;
  String name;
  String code;
  int sectionId;

  Lecture({
    @required enrolledDate,
    @required sectionNO,
    @required faculty,
    @required name,
    @required code,
    @required sectionId,
  }) {
    this.enrolledDate = enrolledDate;
    this.code = code;
    this.facultyDetais = faculty;
    this.name = name;
    this.sectionNo = sectionNo;
    this.sectionId = sectionId;
  }
}
