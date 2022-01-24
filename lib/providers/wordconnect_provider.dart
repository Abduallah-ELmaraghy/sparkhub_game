import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparkhub_game/models/wcmodels/wordconnect.dart';

class WordConnectProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<WordConnect> _Levels = <WordConnect>[];
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

  Future<void> readData() async {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('word_connect')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        WordConnect x = WordConnect(doc['MapLetter'],doc['Wordmap']);
        _Levels.add(x);
        
        
        });
    });
  }
}
