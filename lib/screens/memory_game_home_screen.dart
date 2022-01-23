import 'package:flutter/material.dart';
import '../models/memory_game_card_model.dart';
import 'memory_game_card_screen.dart';
import 'memory_game_levels_screen.dart';
import '../models/memory_game_home_screen_model.dart';
import '../constants/style.dart';
import 'memory_game_levels_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:sparkhub_game/constants/style.dart';

MemoryGameHomePageModel homeModel = MemoryGameHomePageModel();

class MemoryGameHomeScreen extends StatefulWidget {
  const MemoryGameHomeScreen({Key? key}) : super(key: key);

  @override
  MemoryGameHomeScreenState createState() => MemoryGameHomeScreenState();
}

class MemoryGameHomeScreenState extends State<MemoryGameHomeScreen> {
  List<CardModel> visiblecards = [];
  List<CardModel> questionPairs = <CardModel>[];

  @override
  void initState() {
    super.initState();

    //reStart();
  }

  MemoryGameHomeScreenState() {
    homeModel.points = 0;
    reStart();
  }

  void reStart() {
    myPairs = homeModel.getPairs();
    myPairs.shuffle();

    visiblecards = myPairs;
    player1.open(Audio("assets/Sounds/simple-game-countdown.wav"));
    Future.delayed(const Duration(seconds: 5), () {
      player2.open(Audio("assets/Sounds/A Day at the Circus.mp3"));
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        print("2 seconds done");
        // code for open new view
        questionPairs = homeModel.getQuestionPairs();
        visiblecards = questionPairs;
        homeModel.selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: new Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.blueGrey,
          backgroundColor: kDarkGreen,
          centerTitle: true,
          title: const Text("Memory game"),
        ),
        //backgroundColor: Colors.blueGrey[200],
        backgroundColor: kBackground,
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: <Widget>[
                //SizedBox(
                //height: 40,
                //),
                homeModel.points != details.scoreLevel()
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${homeModel.points}/${details.scoreLevel()}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "Score",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                homeModel.points != details.scoreLevel()
                    ? GridView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 0.0,
                                maxCrossAxisExtent: 100.0),
                        children: List.generate(visiblecards.length, (index) {
                          return CardScreen(
                            imagePathUrl:
                                visiblecards[index].getImageAssetPath(),
                            cardIndex: index,
                            parent: this,
                          );
                        }),
                      )
                    : Column(
                        children: <Widget>[
                          const Text(
                            'Congratulations, You won!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                homeModel.points = 0;
                                player1.stop();
                                player2.stop();
                                reStart();
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Text(
                                "Replay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/MemoryGameLevelsPage');
                              player1.stop();
                              player2.stop();
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueGrey, width: 2),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Text(
                                "Go back",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ]),
      ),
      onWillPop: () async {
        player1.stop();
        player2.stop();
        return true;
      },
    );
  }
}
