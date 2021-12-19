import 'package:flutter/material.dart';
import '../models/memory_game_card_model.dart';
//import '../models/memory_game.dart';
import 'memory_game_home_screen.dart';
import 'memory_game_levels_screen.dart';

class CardScreen extends StatefulWidget {
  final String imagePathUrl;
  final int cardIndex;
  final MemoryGameHomeScreenState parent;

  const CardScreen(
      {required this.imagePathUrl,
      required this.cardIndex,
      required this.parent});

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.cardIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile == myPairs[widget.cardIndex].getImageAssetPath()) {
              print("add point");
              points = points + 1;
              print(selectedTile + " thishis" + widget.imagePathUrl);

              CardModel cardModel = CardModel();
              print(widget.cardIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                cardModel.setImageAssetPath("");
                myPairs[widget.cardIndex] = cardModel;
                print(selectedIndex);
                myPairs[selectedIndex!] = cardModel;
                widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.cardIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.cardIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                widget.parent.setState(() {
                  myPairs[widget.cardIndex].setIsSelected(false);
                  myPairs[selectedIndex!].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.cardIndex].getImageAssetPath();
              selectedIndex = widget.cardIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: myPairs[widget.cardIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.cardIndex].getIsSelected()!
                ? myPairs[widget.cardIndex].getImageAssetPath()
                : widget.imagePathUrl)
            : Image.asset("assets/MemoryGameImages/correct.png"),
      ),
    );
  }
}
