import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sparkhub_game/constants/style.dart';
import 'package:provider/provider.dart';
import 'package:sparkhub_game/screens/matching_easy_game.dart';
import 'package:sparkhub_game/main.dart';
import 'package:sparkhub_game/screens/matching_levels.dart';

class Finish extends StatelessWidget {
   late String score;
   Finish(this.score);
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold( 
         
        body: Container(
           height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration( color:kDarkBlue,),
             child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child:Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
              Container( child:Row(mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Score ${score} / 6' ,style: TextStyle(fontSize: 45,color: kButtonColor.withOpacity(1),fontFamily: 'Cairo'))]) ,
          ),
              Container(  height:300,width: 300, decoration: BoxDecoration( 
                  image: DecorationImage(
                  image: new AssetImage( 
                   "assets/score.gif",),
              ))
             ),
             Padding(padding: const EdgeInsets.only(top: 80),
             child: Container(
                height: 80,
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                         Navigator.popUntil(context, (route) => route.settings.name == "/match");
                   
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Levels',
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
              ),)
             
             
             ],
             )
             ),
      )     
                    
       

    );
  }


}