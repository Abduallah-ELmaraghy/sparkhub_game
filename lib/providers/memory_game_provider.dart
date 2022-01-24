import 'package:flutter/cupertino.dart';
import '../models/memory_game_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MemoryGameProvider extends ChangeNotifier {
  MemoryGameProvider() {
    readData();
  }

  List<Game> _game = <Game>[];

  List<Game> get getGame {
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
          'level': level,
          'levelScore': levelscore,
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

        print("title:" + game.level);
        print("description:" + game.levelScore);
      });
    });
  }

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
}
