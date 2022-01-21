import 'package:flutter/material.dart';
import 'package:sparkhub_game/screens/wcscreens/high_score_page.dart';
import 'package:sparkhub_game/widgets/wcwidgets/icon_widget.dart';
import 'package:sparkhub_game/widgets/wcwidgets/letter_widget.dart';
import 'package:sparkhub_game/models/wcmodels/constants.dart';
import 'package:sparkhub_game/screens/wcscreens/home_page.dart';
import 'package:sparkhub_game/screens/wcscreens/game_page.dart';
//import 'package:timer_count_down/timer_count_down.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FrameBar extends StatefulWidget {
  @override
  _FrameBarState createState() => _FrameBarState();
}

class _FrameBarState extends State<FrameBar> {
  DateTime? alert;
  bool checkAns = false;
  bool _showTimer = true;
  int _seconds = 180;
  Duration animationTime = new Duration(seconds: 2);
  Color bottomBarColor = Color(0xff00adb5);
  Color topBarColor = Color(0xff00adb5);
  Color mainBarColor = Color(0xff00adb5);
  Color tempColor = Color(0xff00adb5);
  int pageIndex = 1;
  int tempScore = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    letters.clear();
    indexes.clear();
    clue = 1;
    updateLetters();
    getLetters_and_indexes();
    alert = DateTime.now().add(Duration(seconds: 10));
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Color(0xffeeeeee),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 30.0,
                decoration: BoxDecoration(
                  color: topBarColor,
                ),
                alignment: AlignmentDirectional.center,
                child: AnimatedContainer(
                  height: 30,
                  color: pageIndex == 1 ? tempColor : mainBarColor,
                  duration: Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconWidget(
                        icons: Icons.videogame_asset,
                        text: ' Lvl : $level ',
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       print("Later");
                      //     });
                      //   },
                      //   child: Countdown(
                      //     seconds: _seconds,
                      //     onFinished: () {
                      //       setState(() {
                      //         _showTimer = false;
                      //         score -= 100;
                      //         Alert(
                      //           context: context,
                      //           type: AlertType.error,
                      //           title: "Time Out",
                      //           style: AlertStyle(
                      //               backgroundColor: Colors.white),
                      //           desc: " You failed to pass the level!",
                      //           buttons: [
                      //             DialogButton(
                      //               child: Text(
                      //                 "Main menu",
                      //                 style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 20),
                      //               ),
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //                 Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                         builder: (context) =>
                      //                             HomePage()));
                      //               },
                      //               color: Colors.grey[600],
                      //             ),
                      //             DialogButton(
                      //               child: Text(
                      //                 "Play again!",
                      //                 style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 20),
                      //               ),
                      //               onPressed: () {
                      //                 map = generateMap(
                      //                     getAllCoords(level));
                      //                 Navigator.pop(context);
                      //                 Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                         builder: (context) =>
                      //                             GamePage()));
                      //               },
                      //               color: Color(0xff222831),
                      //             )
                      //           ],
                      //         ).show();
                      //       });
                      //     },
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            score = 0;
                            wroteBefore.removeRange(0, wroteBefore.length);
                            map = generateMap(getAllCoords(level));
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          });
                        },
                        child: IconWidget(
                          icons: Icons.refresh,
                          text: " Reload ",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 300.0,
                height: 250.0,
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: List.generate(map.length, (index) {
                    return LetterWidget(
                        text: map[index].text, color: map[index].color);
                  }),
                ),
              ),
              // Reload and tip button
              Container(
                height: 30.0,
                decoration: BoxDecoration(color: bottomBarColor),
                alignment: AlignmentDirectional.center,
                child: AnimatedContainer(
                  height: 30,
                  color: pageIndex == 1 ? tempColor : mainBarColor,
                  duration: Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconWidget(
                        icons: Icons.functions,
                        text: "Score : $score",
                      ),
                      Text(
                        currentText,
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            getClue();
                          });
                        },
                        child: IconWidget(
                          icons: Icons.fingerprint,
                          text: "Clue : $clue",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
