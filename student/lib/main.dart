import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/login.dart';
import './pages/profile.dart';
import './pages/lec_details_page.dart';
import './model/user.dart';
import './pages/home.dart';
import './model/lectures.dart';
import './model/records.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: Lectures(),
        ),
        ChangeNotifierProvider.value(value: Records()),
      ],
      child: Consumer<User>(
        builder: (context, user, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "attendance",
          theme: ThemeData(
            primaryColor: Color(0xFF1D1E33),
            accentColor: Color(0xFF78909C),
            textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                body2: TextStyle(
                  fontSize: 15,
                )),
          ),
          home: user.checked
              ? Home()
              : FutureBuilder(
                  future: user.autoLogin(),
                  builder: (context, authuser) => Login()),
          routes: {
            '/login': (context) => Login(),
            '/home': (context) => Home(),
            '/profile': (context) => Profile(),
            '/lecture_details': (context) => LectureDetail(),
          },
        ),
      ),
    );
  }
}
