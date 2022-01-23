import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sparkhub_game/models/matching_model.dart';
import 'package:sparkhub_game/constants/style.dart';
import 'package:provider/provider.dart';
import 'package:sparkhub_game/screens/finishedScreen.dart';
import 'dart:async';
import '../providers/matching_providers.dart';
class MatchingGame extends StatefulWidget {
  createState() => MatchingGameState();
}

class MatchingGameState extends State<MatchingGame> {
    _navigator(String score){
    Navigator.push(context,MaterialPageRoute( builder: (context) => Finish(score)));
  }
  final Map<String, bool> score ={}; //map for the score takes the string (emoji) and bool (correct or not)
 List<Matching> _matching = <Matching>[];
   Map choices = {};
  int counter = 0;
  late DateTime start_time;
  int time_to_finish = 5;
  bool finished = false;
  var time_difference;
  //late String scoree;
  @override
  initState() {
    time_difference = 0;
    start_time = new DateTime.now();
  }
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     MatchingProviders gameProvider =
        Provider.of<MatchingProviders>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      gameProvider.getMatchingsCollectionFromFirebase().then((value) {});
    });
    List<Matching> games = gameProvider.getMatching;
   if(games.isNotEmpty){
    choices = games[0].choices;
    }
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(mounted)
      setState(() {
        if ((time_to_finish - time_difference).toInt() > 0) {
          time_difference = new DateTime.now().difference(start_time).inSeconds;
        } else {
          if (finished == false) {
            _navigator(score.length.toString());
            finished = true;
          }
        }
      });
    });
   return Scaffold(
     backgroundColor: kBackground,
       appBar: AppBar(
        title: //Text('Score ${score.length} / 6',style:TextStyle(color: kBackground)),
            Text((time_to_finish - time_difference).toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: kBlack.withOpacity(1),
                    fontFamily: 'Cairo')),
        backgroundColor: kButtonColor,
      ),
      
      body:(choices.isEmpty)? Container(child: Text('Loading...'),): Row(
        // all the app in row
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Place the free space evenly between the children widget and page
        children: [
          Container( padding: const EdgeInsets.all(15),
            child: Column(
                // emojis
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: choices.keys.map((emoji) // the selected emoji
                    {
                  return Draggable<String>(
                    data: emoji,
                    child: Emoji(
                      // the state of the emoji when its waiting around (the transpart container)
                      emoji: score[emoji] == true? '✔️': emoji,), // if the dargging is true
                    feedback: Emoji(emoji: emoji), //what appears while dragging 
                    childWhenDragging: Emoji(emoji: ''), // what remains behind
                  );
                }).toList()),
          ), 
          Container(padding: const EdgeInsets.all(15),
            child: Column(
              //colors
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:
                  choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                    ..shuffle(Random(counter)), 
            ),
          )
        ],
      ),
    );
  }
      Widget _keepgoingScreen(BuildContext context) {
    return Align(
    child:InkWell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child:Container( 
           width:80,
        height:80,
        decoration: BoxDecoration( 
          image: DecorationImage(
              image:  AssetImage("assets/200w.gif"),fit: BoxFit.fill,)
              )
      ),
    )
    )
    );
   }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        List<String> color_string = choices[emoji].toString().split(',');
        Color color = Color.fromARGB(255, int.parse(color_string[0]), int.parse(color_string[1]), int.parse(color_string[2]));
        if (score[emoji] == true) {
          return _keepgoingScreen(context);
        } else {
          return Container(color: color, height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji, //test if it accecpted oe not
      onAccept: (data) {
        setState(() {
          if(mounted)
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