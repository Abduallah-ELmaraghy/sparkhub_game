import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparkhub_game/models/wcmodels/wordconnect.dart';

class WordConnectProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<WordConnect> _Levels = <WordConnect>[];
//  String MapLetter;
// List<Map<String, String>> wordsMap;
// WordConnect(this.MapLetter,this.wordsMap);
// List<Map<String, String>> wordsMap= [{
// "YEMEK":"3,9,15,21,27",
// "EMEK": "14,15,16,17",
// "YEM":  "3,4,5",
// }];
// List<String> get cart => MapLetter;
// int get count => mapLetter1.length;


  Future<void> addWordMapController(
      List<Map<String, String>> item, String name) {
    // Call the user's CollectionReference to add a new user
    CollectionReference collection =
        FirebaseFirestore.instance.collection('word_connect');
    WordConnect x = WordConnect(name, item);
    return collection
        .add({
          'Wordmap': x.WordMap, // John Doe
          'MapLetter': x.MapLetter // John Doe
        })
        .then((value) => print("Recorded"))
        .catchError((error) => print("Failed to add record: $error"));
    notifyListeners();
  }
}
