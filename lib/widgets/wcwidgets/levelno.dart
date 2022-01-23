import 'package:flutter/material.dart';
import 'package:sparkhub_game/models/wcmodels/constants.dart';
import 'package:sparkhub_game/screens/wcscreens/game_page.dart';

class LevelNo extends StatelessWidget {
  var number;
  LevelNo(this.number);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        level = number;
        map = generateMap(getAllCoords(number));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GamePage()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue[900],
        ),
        width: 100,
        height: 50,
        child: const Center(
            child: Text(
          "1",
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
