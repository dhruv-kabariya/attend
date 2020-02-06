import 'package:flutter/material.dart';

class FacultyPhoto extends StatelessWidget {
  const FacultyPhoto({
    Key key,
    @required this.block_h,
    @required this.block_w,
  }) : super(key: key);

  final double block_h;
  final double block_w;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: block_h * 30,
        width: block_w * 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage('assets/dhruv_au.jpg'), fit: BoxFit.fill)),
      ),
    );
  }
}
