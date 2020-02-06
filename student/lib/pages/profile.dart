import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/details.dart';

import '../model/user.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    double blockHeight = phoneHeight / 100;
    double blockwidh = phoneWidth / 100;

    return Consumer<User>(
      builder: (context, user, _) => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
              ),
              Container(
                height: 100,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Container(
          height: blockHeight * 90,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                height: blockHeight * 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'), fit: BoxFit.fill)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Container(
                    height: blockHeight * 60,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                  left: (blockwidh * 35),
                  top: (blockHeight * 20),
                  child: Card(
                    elevation: 8,
                    shape: CircleBorder(),
                    child: Container(
                      height: blockwidh * 30,
                      width: blockwidh * 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/dhruv_au.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  )),
              Positioned(
                  top: blockHeight * 35,
                  left: blockwidh * 5,
                  child: Container(
                    height: blockHeight * 10,
                    width: blockwidh * 90,
                    child: Center(
                      child: Text(
                        Provider.of<User>(context).detail["first_name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 20
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                  )),
              Positioned(
                  top: blockHeight * 40,
                  left: blockwidh * 5,
                  child: Container(
                      height: blockHeight * 40,
                      width: blockwidh * 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Details(
                            blockHeight: blockHeight,
                            blockwidh: blockwidh,
                            detailName:
                                Provider.of<User>(context).detail["email"],
                            iconName: Icons.email,
                          ),
                          Divider(
                            color: Colors.amber,
                            // height: blockwidh*60,

                            thickness: 3,
                          ),
                          Details(
                            blockHeight: blockHeight,
                            blockwidh: blockwidh,
                            detailName:
                                Provider.of<User>(context).detail["course"],
                            iconName: Icons.school,
                          )
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
