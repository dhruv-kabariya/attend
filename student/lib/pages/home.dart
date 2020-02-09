import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lecture.dart';
import '../model/scan.dart';
import '../model/user.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double blockHeight = (MediaQuery.of(context).size.height) / 100;
    double blockWidth = (MediaQuery.of(context).size.width) / 100;
    int enrollNo = Provider.of<User>(context, listen: false).enrollment_id;

    Future<void> scan() async {
      String b =
          await Provider.of<Scan>(context, listen: false).attend(enrollNo);

      return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Status'),
              content: Container(
                child: Text(b),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendace'),
      ),
      body: Lecture1(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: blockHeight * 8,
            width: blockWidth * 30,
            child: Center(
              child: IconButton(
                iconSize: 30,
                icon: Icon(Icons.assignment_turned_in),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            width: blockWidth * 30,
          ),
          Container(
            height: blockHeight * 8,
            width: blockWidth * 30,
            child: Center(
              child: IconButton(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/dhruv_au.jpg',
                        ),
                      )),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        shape: CircleBorder(),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
