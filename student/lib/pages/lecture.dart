import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/lecturecard.dart';
import '../model/lectures.dart';
import '../model/user.dart';

class Lecture1 extends StatefulWidget {
  @override
  _Lecture1State createState() => _Lecture1State();
}

class _Lecture1State extends State<Lecture1> {
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Lectures>(context, listen: false)
          .dashboard(Provider.of<User>(context).enrollNo.toString())
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : LectureCard();
  }
}
