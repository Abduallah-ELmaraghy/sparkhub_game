import 'package:flutter/material.dart';
import 'package:sparkhub_game/constants/style.dart';
import 'package:sparkhub_game/screens/matching_easy_game.dart';
import 'package:sparkhub_game/screens/matching_game.dart';
import '../models/memory_game_levels_model.dart';

Details details = Details();

class LevelsPagematch extends StatefulWidget {
  const LevelsPagematch({Key? key}) : super(key: key);

  @override
  LevelsPageState createState() => LevelsPageState();
}

class LevelsPageState extends State<LevelsPagematch> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          backgroundColor: kButtonColor,
        ),
        body: 
        Column (  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                     onPressed: () {
                      setState(() {
                         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MatchingGameEasy()),
                              );
                      });
                     },
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '1',
                          style: TextStyle(
                              fontFamily: "Font1",
                              fontSize: 40,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  )),
                  SizedBox(height: 20,width: 10,),
                  
               Container(
                height: 150,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {

                    setState(() {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MatchingGame()),
                              );
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '2',
                        style: TextStyle(
                            fontFamily: "Font1",
                            fontSize: 40,
                            fontWeight: FontWeight.normal),
                      ),
             
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        )
        ])
    );
  }
}
