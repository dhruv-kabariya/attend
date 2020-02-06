import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:student/widget/details.dart';

class User with ChangeNotifier {
  String first_name;
  String last_name;
  int enrollment_id;
  String email;
  String middle_name;
  String course;
  int batch;
  bool signedin = false;

  Future<void> save(dynamic response) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    this.first_name = response["first_name"];
    this.last_name = response["last_name"];
    this.enrollment_id = response["enrollment_no"];
    this.email = response["email"];
    this.middle_name = response["middle_name"];
    this.batch = response["batch"];
    this.course = response["course"];

    sharedPreferences.setString("first_name", first_name);
    sharedPreferences.setString("last_name", last_name);
    sharedPreferences.setString("middle_name", middle_name);
    sharedPreferences.setInt("enrollment_id", enrollment_id);
    sharedPreferences.setString("email", email);
    sharedPreferences.setInt("batch", batch);
    sharedPreferences.setString("course", course);
    sharedPreferences.setBool("signedin", true);

    notifyListeners();
  }

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("first_name", null);
    sharedPreferences.setString("middle_name", null);
    sharedPreferences.setString("last_name", null);
    sharedPreferences.setString("enrollment_id", null);
    sharedPreferences.setString("email", null);
    sharedPreferences.setString("batch", null);
    sharedPreferences.setString("course", null);
    notifyListeners();
  }

  Future<bool> autoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey("signedin")) {
      this.first_name = pref.getString("first_name");
      this.last_name = pref.getString("last_name");
      this.middle_name = pref.getString("middle_name");
      this.enrollment_id = pref.getInt("enrollment_id");
      this.email = pref.getString("email");
      this.batch = pref.getInt("batch");
      this.course = pref.getString("course");
      this.signedin = pref.getBool("signedin");
      notifyListeners();

      return signedin;
    }
    return false;
  }

  bool get checked {
    return signedin;
  }

  Map<String, String> get detail {
    Map<String, String> vari = {
      "first_name": first_name,
      "last_name": last_name,
      "course": course,
      "email": email,
    };

    return vari;
  }

  int get enrollNo {
    return enrollment_id;
  }
}
