import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR/Bar Code Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter QR/Bar Code Reader'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _qrInfo = 'Scan a QR/Bar code';

  Future<String> _scan() async {
    String result;
    try {
      result = await BarcodeScanner.scan();
      setState(() {
        print(result);
        _qrInfo = result;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _qrInfo = "permission denaid";
        });
      } else {
        setState(() {
          _qrInfo = ex.code;
        });
      }
    } on FormatException {
      setState(() {
        _qrInfo = "back button";
      });
    } catch (ex) {
      setState(() {
        _qrInfo = ex.code;
      });
    }
    return result;
  }

  void doit() {
    List results = ["hello"];

    for (int i = 0; i < 2; i++) {
      String temp = _scan().toString();
      results.add(temp);
      print(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 500,
            child: FlatButton(
              child: Text(_qrInfo),
              onPressed: doit,
            ),
          ),
        ));
  }
}
