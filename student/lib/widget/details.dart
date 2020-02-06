import 'package:flutter/material.dart';


class Details extends StatelessWidget {
  const Details({
    Key key,
    @required this.blockHeight,
    @required this.blockwidh,
    @required this.detailName,
    @required this.iconName,
    
  }) : super(key: key);
  final String detailName ;
  final double blockHeight;
  final double blockwidh;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight*10,
      width: blockwidh*90,
        child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconName
          ),
          SizedBox(
            width: blockwidh*5,
          ),
          Text(
            detailName
          )
        ],
      ),
    );
  }
}