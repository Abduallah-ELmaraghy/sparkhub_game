import 'package:flutter/material.dart';
import 'dart:math';

class MatchingGame extends StatefulWidget {
  createState() => MatchingGameState();
}

class MatchingGameState extends State<MatchingGame> {
  final Map<String, bool> score =
      {}; //map for the score takes the string (emoji) and bool (correct or not)

  final Map choices = {
    '🦞': Colors.red,
    '🌳': Colors.green,
    '🥶': Colors.blue,
    '🍋': Colors.yellow,
    '🏀': Colors.orange,
    '💜': Colors.purple,
  };

  int counter = 0; // for the score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            counter++;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyan,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Row(
        // all the app in row
        mainAxisAlignment: MainAxisAlignment
            .spaceAround, // Place the free space evenly between the children widget and page
        children: [
          Column(
              // emojis
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: choices.keys.map((emoji) // the selected emoji
                  {
                return Draggable<String>(
                  data: emoji,
                  child: Emoji(
                    // the state of the emoji when its waiting around (the transpart container)
                    emoji: score[emoji] == true
                        ? '✔️'
                        : emoji, // if the dargging is true
                  ),
                  feedback: Emoji(emoji: emoji), //what appears while dragging 
                  childWhenDragging: Emoji(emoji: ''), // what remains behind
                );
              }).toList()), // why to list??
          Column(
            //colors
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(counter)), //?
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) //?
          {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: const Text('Correct!!'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200); //?
        }
      },
      onWillAccept: (data) => data == emoji, //test if it accecpted oe not
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center, //emojis in center of the container
        height: 60,
        child: Text(
          emoji,
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
