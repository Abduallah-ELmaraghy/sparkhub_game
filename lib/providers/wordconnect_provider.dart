import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WordConnect extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

 
// List<Map<String, String>> wordsMap= [{
// "YEMEK":"3,9,15,21,27",
// "EMEK": "14,15,16,17",
// "YEM":  "3,4,5",
// }];
// List<String> get cart => MapLetter;
// int get count => mapLetter1.length;

  
  Future<void> addMapLetterController(String item) {
    // Call the user's CollectionReference to add a new user
    CollectionReference collection =
    FirebaseFirestore.instance.collection('word_connect');

    return collection
        .add({
          'Wordmap': item, // John Doe
        })
        .then((value) => print("Recorded"))
        .catchError((error) => print("Failed to add record: $error"));
     notifyListeners();
  }
}
