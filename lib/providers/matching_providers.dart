import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparkhub_game/models/matching_model.dart';
import 'package:sparkhub_game/models/matching_model.dart';

class MatchingProviders extends ChangeNotifier {
  //Notes List
  bool _isLoaded = false;
  List<Matching> _matching = <Matching>[];
  List<Matching> get getMatching {
    return _matching;
  }

  Future<void> getMatchingsCollectionFromFirebase() async {
    if (_matching.isNotEmpty) return;
    FirebaseFirestore _instance = FirebaseFirestore.instance;

    CollectionReference matchings = _instance.collection("matchings");
    QuerySnapshot querySnapshot = await matchings.get();
    final allData = List.from(
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id}));
    for (var element in allData) {
      print(element['data']['choices']);
      Matching matching = Matching.fromJson(element);
      _matching.add(matching);
    }
      _isLoaded = true;
      notifyListeners();
  }

// function to add data to list of notes
  // void addMatching(String color, String id, String emoji) {
  //   var added_matching = FirebaseFirestore.instance.collection('matchings').add({
  //     'color': color,
  //     'id': id,
  //      'emoji': emoji,
     
  //   }).then((value) {
  //     Matching matching = new Matching(
  //         id: value.id,
  //         emoji:emoji,
  //         color:color
  //        );
  //     _matching.add(matching);
  //     notifyListeners();
  //   });
  // }

  // void editMatching(int index, String id, String color, String emoji,
  //     String p_price, String p_promotion_price) {
  //   var added_matching =
  //       FirebaseFirestore.instance.collection('matchings').doc(id).update({
  //     'color': color,
  //     'id': id,
  //     'emoji': emoji,
     
  //   }).then((value) {
  //     Matching matching = new Matching(
  //      );
  //     _matching[index].color = color;
  //     _matching[index].emoji = emoji;
  //     _matching[index].id = id;
  //      notifyListeners();
  //   });
  // }

  // function to remove or delete Matching by using list index position
  void removeMatching(int index) {
    String? id = _matching[index].id;
    FirebaseFirestore.instance.collection('matchings').doc(id).delete();
    _matching.removeAt(index);
    notifyListeners();
  }
}
