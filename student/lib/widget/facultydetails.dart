import 'package:flutter/material.dart';

class FacultyDetails extends StatelessWidget {
  const FacultyDetails({
    Key key,
    @required this.block_w,
    @required this.block_h,
    @required this.for_what,
    @required this.data,
  }) : super(key: key);

  final double block_w;
  final double block_h;
  final String for_what;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(block_w * 2),
        height: block_h * 5,
        width: block_w * 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: block_h * 5,
              width: block_w * 12,
              child: Text(
                for_what,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Container(
              height: block_h * 5,
              width: block_w * 28,
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            )
          ],
        ));
  }
}
