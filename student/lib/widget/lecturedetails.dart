import 'package:flutter/material.dart';

class LectureDetails extends StatelessWidget {
  const LectureDetails({
    Key key,
    @required this.block_h,
    @required this.block_w,
    @required this.code,
    @required this.name,
    @required this.fname,
    @required this.section,
  }) : super(key: key);

  final double block_h;
  final double block_w;
  final String code;
  final String name;
  final String fname;
  final String section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Container(
          height: block_h * 20,
          width: block_w * 95,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: block_h * 2, horizontal: block_w * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: block_h * 4,
                    width: block_w * 95,
                    child: Text(
                      'Course Code : $code',
                      style: TextStyle(fontSize: 15),
                    )),
                Container(
                    height: block_h * 4,
                    width: block_w * 95,
                    child: Text(
                      'Course Name : $name',
                      style: TextStyle(fontSize: 15),
                    )),
                Container(
                    height: block_h * 4,
                    width: block_w * 95,
                    child: Text(
                      'Faculty Name : $fname',
                      style: TextStyle(fontSize: 15),
                    )),
                Container(
                    height: block_h * 4,
                    width: block_w * 95,
                    child: Text(
                      'Section : $section',
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
