import 'package:flutter/cupertino.dart';
import '../models/memory_game_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MemoryGameProvider extends ChangeNotifier {
  MemoryGameProvider() {
    readData();
    //Future.delayed(const Duration(seconds: 5));
    //print("notes are:" + getNotes().toString());
  }

  //Notes List
  List<Game> _game = <Game>[];

  List<Game> get getGame {
    //Note note = new Note(8.toString(), 0.toString());
    //_notes.add(note);
    //readData();
    //Future.delayed(const Duration(seconds: 5));
    return _game;
  }

  Future<void> addData(String level, String levelscore) async {
    /* final Stream<QuerySnapshot> game =
        FirebaseFirestore.instance.collection('admin_memoryGame').snapshots();*/
    Game note = Game(level, levelscore);

    _game.add(note);

    notifyListeners();
    CollectionReference users =
        FirebaseFirestore.instance.collection('admin_memory_game');

    // Call the user's CollectionReference to add a new user
    return users
        .doc((_game.length - 1).toString())
        .set({
          'level': level, // John Doe
          'levelScore': levelscore, // Stokes and Sons
        })
        .then((value) => print("Game Added"))
        .catchError((error) => print("Failed to add Game: $error"));
  }

  Future<void> readData() async {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('admin_memory_game')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Game game = Game(doc["level"].toString(), doc["levelScore"].toString());

        _game.add(game);

        //_notes.add(doc["level"]);
        //_notes.add(doc["levelScore"]);

        print("title:" + game.level);
        print("description:" + game.levelScore);
      });
    });
  }

// function to add data to list of notes
  /*Future<void> addNotes(String title, String descriptions) async {
    Note note = new Note(title, descriptions);

    _notes.add(note);

    notifyListeners();
  }*/

  // function to remove or delete notes by using list index position
  //CollectionReference users = FirebaseFirestore.instance.collection('admin_memory_game');

  Future<void> removeGame(int index) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('admin_memory_game');
    _game.removeAt(index);
    notifyListeners();
    return users
        .doc((index).toString())
        .delete()
        .then((value) => print("Game Deleted"))
        .catchError((error) => print("Failed to delete Game: $error"));
  }

  /* Future<void> removeNotes2(int index) async {
    _notes.removeAt(index);
    notifyListeners();
  }*/
}
