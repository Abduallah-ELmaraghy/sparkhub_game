import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sparkhub_game/models/wcmodels/Constants.dart';
import 'package:sparkhub_game/widgets/wcwidgets/IconWidget.dart';
import 'package:sparkhub_game/screens/wcscreens/GamePage.dart';
import 'package:sparkhub_game/screens/wcscreens/LevelsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String difficulty = '';

  // getLevel() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   lastLevel = prefs.getInt('savLev') ?? 0;
  //   print(prefs.getInt('savLev'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Word Count",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 50,
                    color: Color(0xffeeeeee)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          level = 1;
                          setState(() {
                            map = generateMap(getAllCoords(1));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          });
                        },
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          child: Center(
                            child: IconWidget(
                              icons: Icons.play_circle_filled,
                              text: "Play",
                              size: 40,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff222831),
                          ),
                        )),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LevelsPage()));
                      });
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Center(
                        child: IconWidget(
                          icons: FontAwesomeIcons.map,
                          text: "Levels",
                          size: 25,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff222831),
                      ),
                    )),
                
              ],
            ),
          ),
         
        ]),
      ),
    );
  }
}
