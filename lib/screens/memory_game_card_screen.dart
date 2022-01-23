import 'package:flutter/material.dart';
import '../models/memory_game_card_model.dart';
import 'memory_game_home_screen.dart';

List<CardModel> myPairs = <CardModel>[];

class CardScreen extends StatefulWidget {
  final String imagePathUrl;
  final int cardIndex;
  final MemoryGameHomeScreenState parent;

  // ignore: use_key_in_widget_constructors
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
        if (!homeModel.selected) {
          setState(() {
            myPairs[widget.cardIndex].setIsSelected(true);
          });
          if (homeModel.selectedCard != "") {
            /// testing if the selected cards are same
            if (homeModel.selectedCard ==
                myPairs[widget.cardIndex].getImageAssetPath()) {
              print("add point");
              homeModel.points = homeModel.points + 1;
              print(homeModel.selectedCard + " thishis" + widget.imagePathUrl);

              CardModel cardModel = CardModel();
              print(widget.cardIndex);
              homeModel.selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                cardModel.setImageAssetPath("");
                myPairs[widget.cardIndex] = cardModel;
                print(homeModel.selectedIndex);
                myPairs[homeModel.selectedIndex!] = cardModel;
                widget.parent.setState(() {});
                setState(() {
                  homeModel.selected = false;
                });
                homeModel.selectedCard = "";
              });
            } else {
              print(homeModel.selectedCard +
                  " thishis " +
                  myPairs[widget.cardIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.cardIndex);
              print(homeModel.selectedIndex);
              homeModel.selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                widget.parent.setState(() {
                  myPairs[widget.cardIndex].setIsSelected(false);
                  myPairs[homeModel.selectedIndex!].setIsSelected(false);
                });
                setState(() {
                  homeModel.selected = false;
                });
              });

              homeModel.selectedCard = "";
            }
          } else {
            setState(() {
              homeModel.selectedCard =
                  myPairs[widget.cardIndex].getImageAssetPath();
              homeModel.selectedIndex = widget.cardIndex;
            });

            print(homeModel.selectedCard);
            print(homeModel.selectedIndex);
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
