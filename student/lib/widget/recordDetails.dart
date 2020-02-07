import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/record.dart';

class Recordetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Record rec = Provider.of<Record>(context, listen: false);

    return ListTile(
      contentPadding: EdgeInsets.all(8),
      title: Text(rec.date),
      trailing: CircleAvatar(
        backgroundColor: rec.attend ? Colors.green : Colors.red,
      ),
    );
  }
}
