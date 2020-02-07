import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lecture_details.dart';
import 'record.dart';
import '../model/lectures.dart';

class LectureDetail extends StatefulWidget {
  @override
  _LectureDetailState createState() => _LectureDetailState();
}

class _LectureDetailState extends State<LectureDetail> {
  @override
  Widget build(BuildContext context) {
    final sectionId = ModalRoute.of(context).settings.arguments;

    final lecture = Provider.of<Lectures>(context).find(sectionId);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lecture.name),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Details',
                icon: Icon(Icons.dashboard),
              ),
              Tab(
                text: 'Record',
                icon: Icon(Icons.check_box),
              )
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          AboutDetails(lecture),
          Record1(sectionId: sectionId)
        ]),
      ),
    );
  }
}
