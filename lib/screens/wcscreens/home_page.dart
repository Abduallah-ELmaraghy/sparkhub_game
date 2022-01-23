import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sparkhub_game/models/wcmodels/constants.dart';
import 'package:sparkhub_game/widgets/wcwidgets/icon_widget.dart';
import 'package:sparkhub_game/screens/wcscreens/game_page.dart';
import 'package:sparkhub_game/screens/wcscreens/levels_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String difficulty = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Word Count",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
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
                        onTap: () {
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
                          width: 250.0,
                          height: 60.0,
                          child: Center(
                            child: IconWidget(
                              icons: Icons.play_circle_filled,
                              text: "Play",
                              size: 50,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffdccb00),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 35,
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
                      width: 250.0,
                      height: 60.0,
                      child: Center(
                        child: IconWidget(
                          icons: FontAwesomeIcons.map,
                          text: "Levels",
                          size: 30,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff6fa8dc),
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
