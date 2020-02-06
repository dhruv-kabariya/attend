import 'package:flutter/cupertino.dart';

class Faculty {
  String name;
  String email;
  int roomNo;
  String campus;

  Faculty({
    @required String name,
    @required String email,
    @required int roomNo,
    @required String campus,
  }) {
    this.name = name;
    this.email = email;
    this.roomNo = roomNo;
    this.campus = campus;
  }
}
