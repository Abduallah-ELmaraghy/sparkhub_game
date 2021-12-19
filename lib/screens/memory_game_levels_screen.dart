import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import '../models/memory_game_levels_model.dart';
import '../models/memory_game_card_model.dart';
//import 'memory_game_homescreen.dart';

Details deatail = Details();
//MemoryGameHomeScreen home = MemoryGameHomeScreen();

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  LevelsPageState createState() => LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
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
                      deatail.setSelectedlevel(0);
                      Navigator.pushNamed(context, "/memoeryGameHomeScreen");
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
                        children: deatail.genratestar(1),
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
                    deatail.setSelectedlevel(1);
                    Navigator.pushNamed(context, "/memoeryGameHomeScreen");
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
                      children: deatail.genratestar(2),
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
                      deatail.setSelectedlevel(2);
                      Navigator.pushNamed(context, "/memoeryGameHomeScreen");
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
                        children: deatail.genratestar(3),
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

String selectedTile = "";
int? selectedIndex;
bool selected = true;
int points = 0;

List<CardModel> myPairs = <CardModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked() {
  List<bool> yoClicked = <bool>[];
  List<CardModel> myairs = <CardModel>[];
  myairs = getPairs();
  for (int i = 0; i < myairs.length; i++) {
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<String> fillSourceArray() {
  return [
    'assets/MemoryGameImages/fox.png',
    'assets/MemoryGameImages/hippo.png',
    'assets/MemoryGameImages/horse.png',
    'assets/MemoryGameImages/monkey.png',
    'assets/MemoryGameImages/panda.png',
    'assets/MemoryGameImages/parrot.png',
    'assets/MemoryGameImages/rabbit.png',
    'assets/MemoryGameImages/zoo.png',
    'assets/MemoryGameImages/dino.png',
    'assets/MemoryGameImages/fish.png',
    'assets/MemoryGameImages/frog.png',
    'assets/MemoryGameImages/girraf.png',
    'assets/MemoryGameImages/octo.png',
    'assets/MemoryGameImages/wolf.png',
    'assets/MemoryGameImages/whale.png',
    'assets/MemoryGameImages/shark.png',
    'assets/MemoryGameImages/seahorse.png',
    'assets/MemoryGameImages/peacock.png',
  ];
}

List sourceArray = fillSourceArray();

int scoreLevel() {
  int levelScore;
  if (deatail.getSelctedLevel() == 2) {
    levelScore = 18;
  } else if (deatail.getSelctedLevel() == 1) {
    levelScore = 12;
  } else if (deatail.getSelctedLevel() == 0) {
    levelScore = 8;
  } else {
    levelScore = 8;
  }
  return levelScore;
}

List<CardModel> getPairs() {
  List<CardModel> pairs = <CardModel>[];

  CardModel cardModel = CardModel();

  if (deatail.getSelctedLevel() == 2) {
    for (int i = 0; i < sourceArray.length; i++) {
      cardModel.setImageAssetPath("${sourceArray[i]}");
      cardModel.setIsSelected(false);
      pairs.add(cardModel);
      pairs.add(cardModel);
      cardModel = CardModel();
    }
  } else if (deatail.getSelctedLevel() == 1) {
    for (int i = 0; i < 12; i++) {
      cardModel.setImageAssetPath("${sourceArray[i]}");
      cardModel.setIsSelected(false);
      pairs.add(cardModel);
      pairs.add(cardModel);
      cardModel = CardModel();
    }
  } else if (deatail.getSelctedLevel() == 0) {
    for (int i = 0; i < 8; i++) {
      cardModel.setImageAssetPath("${sourceArray[i]}");
      cardModel.setIsSelected(false);
      pairs.add(cardModel);
      pairs.add(cardModel);
      cardModel = CardModel();
    }
  }

  return pairs;
}

List<CardModel> getQuestionPairs() {
  List<CardModel> pairs = <CardModel>[];

  CardModel cardModel = CardModel();
  //Level level;

  // Details details = Details();

  if (deatail.getSelctedLevel() == 2) {
    for (int i = 0; i < sourceArray.length; i++) {
      cardModel.setImageAssetPath("assets/MemoryGameImages/question.png");
      cardModel.setIsSelected(false);
      pairs.add(cardModel);
      pairs.add(cardModel);
      cardModel = CardModel();
    }
  } else if (deatail.getSelctedLevel() == 1) {
    for (int i = 0; i < 12; i++) {
      cardModel.setImageAssetPath("assets/MemoryGameImages/question.png");
      cardModel.setIsSelected(false);
      pairs.add(cardModel);
      pairs.add(cardModel);
      cardModel = CardModel();
    }
  } else if (deatail.getSelctedLevel() == 0) {
    for (int i = 0; i < 8; i++) {
      cardModel.setImageAssetPath("assets/MemoryGameImages/question.png");
      cardModel.setIsSelected(false);
      pairs.add(cardModel);
      pairs.add(cardModel);
      cardModel = CardModel();
    }
  }

  return pairs;
}
