import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

import 'lecture.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List result = ['hello'];
    String temp;
    String error;
    double blockHeight = (MediaQuery.of(context).size.height) / 100;
    double blockWidth = (MediaQuery.of(context).size.width) / 100;

    Future<String> scan() async {
      try {
        temp = await BarcodeScanner.scan();
        print(temp);
      } on PlatformException catch (ex) {
        error = ex.code;
      } catch (ex) {
        error = ex;
      }
      return temp;
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
