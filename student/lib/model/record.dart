import 'package:flutter/cupertino.dart';

class Record {
  int sectionId;
  bool attend;
  DateTime date;

  Record(
      {@required int sectionId,
      @required bool attend,
      @required DateTime date}) {
    this.attend = attend;
    this.sectionId = sectionId;
    this.date = date;
  }
}
