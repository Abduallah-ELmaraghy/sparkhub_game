import 'package:flutter/material.dart';
import 'package:sparkhub_game/models/wcmodels/Constants.dart';
import '../models/memory_game_levels_model.dart';
import '../constants/style.dart';
import '../providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

Details details = Details();
AssetsAudioPlayer player1 = new AssetsAudioPlayer();
AssetsAudioPlayer player2 = new AssetsAudioPlayer();

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
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text("Memory game"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 200,
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
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )),
            Container(
              height: 200,
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
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
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
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
            ),
          ],
        ));
  }
}
