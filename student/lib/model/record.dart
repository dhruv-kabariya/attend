import 'package:flutter/cupertino.dart';

class Record extends ChangeNotifier {
  int sectionId;
  bool attend;
  String date;

  Record(
      {@required int sectionId, @required bool attend, @required String date}) {
    this.attend = attend;
    this.sectionId = sectionId;
    this.date = date;
  }
}
