import 'dart:async';

import 'package:flutter/material.dart';
import '../models/memory_game_card_model.dart';
//import '../models/memory_game.dart';
import 'memory_game_card_screen.dart';
import 'memory_game_levels_screen.dart';

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

    reStart();
  }

  MemoryGameHomeScreenState() {
    points = 0;
    reStart();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    visiblecards = myPairs;
    Future.delayed(const Duration(seconds: 5), () {
// Here you can write your code
      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        questionPairs = getQuestionPairs();
        visiblecards = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("Memory game"),
      ),
      backgroundColor: Colors.blueGrey[200],
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              //SizedBox(
              //height: 40,
              //),
              points != scoreLevel()
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$points/${scoreLevel()}",
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
              points != scoreLevel()
                  ? GridView(
                      shrinkWrap: true,
                      //physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                      children: List.generate(visiblecards.length, (index) {
                        return CardScreen(
                          imagePathUrl: visiblecards[index].getImageAssetPath(),
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
                              points = 0;
                              reStart();
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
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
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text(
                              "Go back",
                              style: TextStyle(
                                  color: Colors.blue,
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
    );
  }
}
