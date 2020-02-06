import 'package:flutter/material.dart';

import '../widget/line.dart';
import '../widget/facultydetails.dart';
import '../widget/facultyPhotot.dart';
import '../widget/lecturedetails.dart';
import '../model/lecture.dart';

class AboutDetails extends StatelessWidget {
  Lecture lecture;
  AboutDetails(this.lecture);

  @override
  Widget build(BuildContext context) {
    double block_h = MediaQuery.of(context).size.height / 100;
    double block_w = MediaQuery.of(context).size.width / 100;
    return Container(
      height: block_h * 85,
      width: block_w * 90,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: block_h * 2,
          ),
          DetailsTitle(
            data: 'Lecture Details',
          ),
          Line(block_w: block_w),
          LectureDetails(
            block_h: block_h,
            block_w: block_w,
            code: lecture.code,
            fname: lecture.facultyDetais.name,
            name: lecture.name,
            section: lecture.sectionNo.toString(),
          ),
          SizedBox(
            height: block_h,
          ),
          DetailsTitle(
            data: 'Faculty Details',
          ),
          Line(block_w: block_w),
          FacultyContainer(
            block_h: block_h,
            block_w: block_w,
            name: lecture.facultyDetais.name,
            campus: lecture.facultyDetais.campus,
            email: lecture.facultyDetais.email,
            roomNo: lecture.facultyDetais.roomNo,
          ),
          SizedBox(
            height: block_h,
          ),
          DetailsTitle(
            data: 'Lecture Time',
          ),
          Line(block_w: block_w),
          Padding(
            padding: EdgeInsets.all(block_h * 2),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: block_h * 10,
                width: block_w * 95,
                child: Column(
                  children: <Widget>[
                    Text('The : 2:30 to 4:00'),
                    Text('Tue : 2:30 to 4:00'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FacultyContainer extends StatelessWidget {
  const FacultyContainer({
    Key key,
    @required this.email,
    @required this.campus,
    @required this.name,
    @required this.roomNo,
    @required this.block_h,
    @required this.block_w,
  }) : super(key: key);

  final String name;
  final String email;
  final String campus;
  final int roomNo;

  final double block_h;
  final double block_w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: block_h * 30,
            width: block_w * 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FacultyDetails(
                  block_w: block_w,
                  block_h: block_h,
                  for_what: 'Name : ',
                  data: name,
                ),
                FacultyDetails(
                  block_w: block_w,
                  block_h: block_h,
                  for_what: 'Email : ',
                  data: email,
                ),
                FacultyDetails(
                  block_w: block_w,
                  block_h: block_h,
                  for_what: 'Campus:',
                  data: campus,
                ),
                FacultyDetails(
                  block_w: block_w,
                  block_h: block_h,
                  for_what: 'Room No : ',
                  data: roomNo.toString(),
                ),
              ],
            ),
          ),
        ),
        FacultyPhoto(block_h: block_h, block_w: block_w),
      ],
    );
  }
}

class DetailsTitle extends StatelessWidget {
  const DetailsTitle({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(data),
    );
  }
}
