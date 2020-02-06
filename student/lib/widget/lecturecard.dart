import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/lectures.dart';
import '../model/lecture.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double block_height = MediaQuery.of(context).size.height / 100;
    final double block_width = MediaQuery.of(context).size.width / 100;

    final lectures = Provider.of<Lectures>(context).lectures;

    return ListView.builder(
      itemCount: lectures.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: lectures[index],
        child:
            LectureTexts(block_height: block_height, block_width: block_width),
      ),
    );
  }
}

class LectureTexts extends StatelessWidget {
  const LectureTexts({
    Key key,
    @required this.block_height,
    @required this.block_width,
  }) : super(key: key);

  final double block_height;
  final double block_width;

  @override
  Widget build(BuildContext context) {
    final lecture = Provider.of<Lecture>(context, listen: false);

    return InkWell(
      onTap: () {
        
      
        Navigator.of(context)
            .pushNamed("/lecture_details", arguments: lecture.sectionId);
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple,
                  ),
                  BoxShadow(color: Colors.deepPurpleAccent),
                ]),
            height: block_height * 20,
            width: block_width * 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: block_height * 7,
                  width: block_width * 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: block_height * 6,
                          width: block_width * 20,
                          child: Center(
                            child: Text(
                              lecture.code,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: block_height * 9,
                          width: block_width * 50,
                          child: Center(
                            child: Text(
                              lecture.name,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: block_height * 7,
                  width: block_width * 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Text(
                          lecture.facultyDetais.name,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Thu - 2:30 to 4:00',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Tue - 2:30 to 4:00',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: block_height * 6,
                  width: block_width * 90,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Total Lecture',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              '26',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Attended Lecture',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              '24',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Pesentage',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              '89',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
