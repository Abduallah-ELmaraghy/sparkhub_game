import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparkhub_game/widgets/wcwidgets/menu_bar.dart';
import 'package:sparkhub_game/widgets/wcwidgets/frame_bars.dart';
import 'package:sparkhub_game/widgets/wcwidgets/main_buttons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sparkhub_game/models/wcmodels/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  bool checkAns = false;
  Duration animationTime = new Duration(seconds: 2);
  Color bottomBarColor = Color(0xff00adb5);
  Color topBarColor = Color(0xff00adb5);
  Color mainBarColor = Color(0xff00adb5);
  Color tempColor = Color(0xff00adb5);
  int pageIndex = 1;
  int tempScore = 0;

  saveLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('savLev', level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MenuBar(),
            // El bar el labany
            FrameBar(),

            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    mainButtons(
                      onPress: () {
                        setState(() {
                          if (color1 == activatedColor) {
                            color1 = disabledColor;
                            currentText = currentText.substring(
                                0, currentText.length - 1);
                          } else {
                            color1 = activatedColor;
                            currentText += letter3;
                          }
                        });
                      },
                      letter: letter3,
                      color: color1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              disableAllColors();
                              currentText = "";
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffe23e57),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: Center(
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color2 == activatedColor) {
                                color2 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color2 = activatedColor;
                                currentText += letter5;
                              }
                            });
                          },
                          letter: letter5,
                          color: color2,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color3 == activatedColor) {
                                color3 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color3 = activatedColor;
                                currentText += letter2;
                              }
                            });
                          },
                          letter: letter2,
                          color: color3,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await saveLevel();
                            print(lastLevel);
                            print(level);
                            await getHscores();
                            await saveHighScore();
                            tempScore = score;
                            setState(() {
                              checkAns = checkAnswer(currentText);
                              if (barColour == 1) {
                                tempColor = Colors.green;
                              }
                              if (barColour == 2) {
                                tempColor = Colors.red;
                              }
                            });
                            if (checkAns) {
                              print(highScoreLevel1);
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "Congratulations",
                                style:
                                    AlertStyle(backgroundColor: Colors.white),
                                desc:
                                    'Score :$tempScore and the highest is: $highScoreLevel1',
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Play again!",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      map = generateMap(getAllCoords(level));
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GamePage()));
                                    },
                                    color: Colors.grey[600],
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "Next Level",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      level++;
                                      map = generateMap(getAllCoords(level));
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GamePage()));
                                    },
                                    color: Color(0xff222831),
                                  )
                                ],
                              ).show();
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff00bdaa),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: Center(
                              child: Icon(Icons.check),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color4 == activatedColor) {
                                color4 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color4 = activatedColor;
                                currentText += letter4;
                              }
                            });
                          },
                          letter: letter4,
                          color: color4,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color5 == activatedColor) {
                                color5 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color5 = activatedColor;
                                currentText += letter1;
                              }
                            });
                          },
                          letter: letter1,
                          color: color5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveHighScore() async {
    saveHsFunc(1, highScoreLevel1);
    saveHsFunc(2, highScoreLevel2);
    saveHsFunc(3, highScoreLevel3);
    saveHsFunc(4, highScoreLevel4);
    saveHsFunc(5, highScoreLevel5);
    saveHsFunc(6, highScoreLevel6);
    saveHsFunc(7, highScoreLevel7);
    saveHsFunc(8, highScoreLevel8);
    saveHsFunc(9, highScoreLevel9);
    saveHsFunc(10, highScoreLevel10);
    saveHsFunc(11, highScoreLevel11);
    saveHsFunc(12, highScoreLevel12);
    saveHsFunc(13, highScoreLevel13);
    saveHsFunc(14, highScoreLevel14);
    saveHsFunc(15, highScoreLevel15);
  }

  saveHsFunc(int currLevel, int hScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (level == currLevel) {
      if (score >= hScore) {
        hScore = score;
        await prefs.setInt('highScore$currLevel', hScore);
      }
    }
  }

  getHscores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 16; i++) {
      if (i == 1) {
        highScoreLevel1 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 2) {
        highScoreLevel2 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 3) {
        highScoreLevel3 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 4) {
        highScoreLevel4 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 5) {
        highScoreLevel5 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 6) {
        highScoreLevel6 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 7) {
        highScoreLevel7 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 8) {
        highScoreLevel8 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 9) {
        highScoreLevel9 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 10) {
        highScoreLevel10 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 11) {
        highScoreLevel11 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 12) {
        highScoreLevel12 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 13) {
        highScoreLevel13 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 14) {
        highScoreLevel14 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 15) {
        highScoreLevel15 = (prefs.getInt('highScore$i') ?? 0);
      }
    }
  }
}
