
import 'package:sparkhub_game/screens/wcscreens/HighScorePage.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar>{
    Widget build(BuildContext context) {
    return Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //first bar back arrow
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 40.0,
                        color: Color(0xffeeeeee),
                      ),
                    ),
                    //three dash for menu
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HighScorePage()));
                        },
                        child: Icon(Icons.library_books_rounded,
                            color: Color(0xffeeeeee))),
                  ],
                ),
                color: Color(0xff000000),
              ),
            
            );
}
}