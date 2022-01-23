import 'package:flutter/material.dart';

import '../models/memory_game_levels_model.dart';
import '../constants/style.dart';
import '../providers/memory_game_provider.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:sparkhub_game/constants/style.dart';

Details details = Details();
AssetsAudioPlayer player1 = AssetsAudioPlayer();
AssetsAudioPlayer player2 = AssetsAudioPlayer();

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  LevelsPageState createState() => LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
  LevelsPageState() {
    //player1.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blueGrey[200],
        backgroundColor: kBackground,
        /*appBar: new AppBar(
          // backgroundColor: Colors.white,
          //titleSpacing: 0.0,
          toolbarHeight: 400,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Column(children: [
            Text(
              "Train your memory by playing",
              style: TextStyle(color: Colors.black),
            ),
            Image.asset(
              "assets/memoryGame.gif",
              //height: 200,
              // width: 1000,
              //fit: BoxFit.cover,
              fit: BoxFit.fitWidth,
            ),
          ]),
        ),*/
        /*appBar: AppBar(
          
          toolbarHeight: 100,
          backgroundColor: kDarkGreen,
          centerTitle: true,
          title: const Text(
            "Memory Game",
            style: TextStyle(
                fontFamily: "Font1",
                fontSize: 40,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            
          ),
        ),*/
        appBar: AppBar(
          //backgroundColor: Colors.blueGrey,
          backgroundColor: kDarkGreen,
          centerTitle: true,
          title: const Text("Memory game"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "assets/memoryGame.gif",
              height: 200,
              // width: 1000,
              //fit: BoxFit.cover,
              fit: BoxFit.fitWidth,
            ),
            Container(
                height: 100,
                width: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      details.setSelectedlevel(0);
                      Navigator.pushNamed(context, "/memoeryGameHomeScreen");

                      player1.open(
                          Audio("assets/Sounds/simple-game-countdown.wav"));
                      Future.delayed(const Duration(seconds: 5), () {
                        player2.open(
                            Audio("assets/Sounds/A Day at the Circus.mp3"));
                      });
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'EASY',
                        style: TextStyle(
                            fontFamily: "Font1",
                            fontSize: 40,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: details.genratestar(1),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff0d5063),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )),
            Container(
              height: 100,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    details.setSelectedlevel(1);
                    Navigator.pushNamed(context, "/memoeryGameHomeScreen");
                    player1
                        .open(Audio("assets/Sounds/simple-game-countdown.wav"));
                    Future.delayed(const Duration(seconds: 5), () {
                      player2
                          .open(Audio("assets/Sounds/A Day at the Circus.mp3"));
                    });
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'MEDIUM',
                      style: TextStyle(
                          fontFamily: "Font1",
                          fontSize: 40,
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: details.genratestar(2),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff0d5063),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      details.setSelectedlevel(2);
                      Navigator.pushNamed(context, "/memoeryGameHomeScreen");
                      player1.open(
                          Audio("assets/Sounds/simple-game-countdown.wav"));
                      Future.delayed(const Duration(seconds: 5), () {
                        player2.open(
                            Audio("assets/Sounds/A Day at the Circus.mp3"));
                      });
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Hard',
                        style: TextStyle(
                            fontFamily: "Font1",
                            fontSize: 40,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: details.genratestar(3),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff0d5063),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
            ),
          ],
        ));
  }
}
