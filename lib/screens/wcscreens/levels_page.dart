import 'package:flutter/material.dart';
import 'package:sparkhub_game/models/wcmodels/constants.dart';
import 'package:sparkhub_game/screens/wcscreens/game_page.dart';
import 'package:sparkhub_game/widgets/wcwidgets/levelno.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  _LevelsPageState createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {

    CollectionReference collection = FirebaseFirestore.instance.collection('word_connect');

final children = <Widget>[];
  //children.add(new ListTile());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
for (var i = 0; i < 2; i++) {
  children.add(LevelNo(i));
}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00adb5),
        title: Text("Levels"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 40, // add custom icons also
          ),
        ),
      ),
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Container(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(50),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children:children,
          ),
        ),
      ),
    );
  }
}
