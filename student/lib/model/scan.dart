import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:student/model/records.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';
import 'package:http/http.dart' as http;

class Scan extends ChangeNotifier {
  String result;
  bool error = true;
  Records rec = Records();
  String mac;
  String ip;
  String ai;

  JsonDecoder _decoder = JsonDecoder();

  void attend(int enrollNo) {
    var body = Map<String, dynamic>();
    scan();
    Duration(seconds: 5);
    body["section_id"] = 1011;
    body["student_id"] = enrollNo;
    body["mac"] = "g1hgxhg3b1hxgz";
    body["ip"] = ip;
    body["AndroidId"] = ai;
    call(body);
  }

  Future<void> scan() async {
    try {
      result = await BarcodeScanner.scan();
      print(result);
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        error = true;
        result = "Camera Access Denaid";
      } else {
        error = true;
        result = "Unknown Error $ex";
      }
    } on FormatException {
      error = true;
      result = "You pressed Back button";
    } catch (ex) {
      error = true;
      result = "Unknown Error $ex";
    }
  }

  Future<void> call(Map<String, dynamic> body) async {
    String url = "http://192.168.1.6:8000/api" + "/attend/";
    Map<String, String> header = {"Content-type": "application/json"};

    var res = await http
        .post(url, body: json.encode(body), headers: header)
        .then((http.Response response) {
      final body = response.body;
      int statusCode = response.statusCode;

      print(response.body);

      if (statusCode > 400 || statusCode < 200) {
        throw Exception("Error Attend");
      }

      return _decoder.convert(body);
    });

    rec.adding(body["attend"], body["date"], body["section_id"]);
  }

  Future<void> deviceInfo() async {
    WifiInfoWrapper infoWrapper = WifiInfoWrapper();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    try {
      infoWrapper = await WifiInfoPlugin.wifiDetails;
      mac = infoWrapper.macAddress;
      print(mac);
      ip = infoWrapper.ipAddress;
      ai = androidInfo.androidId;
    } on PlatformException {
      print("Exception occure");
    }
  }
}
