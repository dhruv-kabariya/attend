import 'package:flutter/material.dart';

import '../widget/recordDetails.dart';

class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double block_heigth = MediaQuery.of(context).size.height / 100;
    double block_width = MediaQuery.of(context).size.width / 100;

    return Column(
      children: <Widget>[
        Container(
          height: block_heigth * 20,
          width: double.infinity,
          color: Colors.amber,
          child: Text('Here animation'),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Recordetails(),
            itemCount: 15,
          ),
        )
      ],
    );
  }
}
