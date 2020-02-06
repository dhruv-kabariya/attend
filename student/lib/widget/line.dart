import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key key,
    @required this.block_w,
  }) : super(key: key);

  final double block_w;

  @override
  Widget build(BuildContext context) {
    return Divider(
      // height: block_w * 95,
      thickness: 3,
      indent: block_w * 3,
      endIndent: block_w * 3,

      color: Colors.pink,
    );
  }
}
