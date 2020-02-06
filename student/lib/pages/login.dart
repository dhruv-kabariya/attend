import 'package:flutter/material.dart';

import '../utils/apiCall.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    double blockHeight = phoneHeight / 100;
    double blockwidh = phoneWidth / 100;
    ApiCall api = ApiCall();

    TextEditingController _userNamecontroller = TextEditingController(),
        _passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: phoneHeight,
            width: double.infinity,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: blockHeight * 10,
                  width: blockwidh * 100,
                ),
                Container(
                  height: blockHeight * 15,
                  width: blockwidh * 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/au_png.jpg'),
                          fit: BoxFit.fitHeight)),
                ),
                Container(
                  height: blockHeight * 10,
                  width: blockwidh * 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/au_name.jpg'),
                      // fit: BoxFit.fill
                    ),
                  ),
                ),
                SizedBox(
                  height: blockHeight * 5,
                ),
                Container(
                  height: blockHeight * 20,
                  child: ListView(
                    children: <Widget>[
                      TextField(
                        textAlign: TextAlign.center,
                        controller: _userNamecontroller,
                        decoration: InputDecoration(
                            labelText: "Enrollment Number",
                            icon: Icon(Icons.email),
                            contentPadding: EdgeInsets.all(10)),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration:
                            InputDecoration(labelText: "Enter Your Password"),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: blockHeight * 10,
                    width: blockwidh * 80,
                    child: Center(
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: () => api.login(
                            _userNamecontroller.text, _passwordController.text),
                        child: Text('Login'),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
