import 'package:flutter/material.dart';

class Recordetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      title: Text('28-11-2000'),
      trailing: CircleAvatar(
        backgroundColor: Colors.green,
      ),
    );
  }
}
