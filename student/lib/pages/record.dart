import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/recordDetails.dart';
import '../model/records.dart';
import '../model/record.dart';

class Record1 extends StatelessWidget {
  int sectionId;
  Record1({this.sectionId});
  @override
  Widget build(BuildContext context) {
    double block_heigth = MediaQuery.of(context).size.height / 100;
    List<Record> record = Provider.of<Records>(context).course(sectionId);

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
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: record[index], child: Recordetails()),
            itemCount: record.length,
          ),
        )
      ],
    );
  }
}
