import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/memory_game_provider.dart';

class Details {
  int level = 0;
  int noOfstar = 1;
  Details();

  void setSelectedlevel(int lev) {
    level = lev;
  }

  int getSelctedLevel() {
    return level;
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }

  int scoreLevel() {
    int levelScore;
    if (getSelctedLevel() == 2) {
      levelScore = 18;
    } else if (getSelctedLevel() == 1) {
      levelScore = 12;
    } else if (getSelctedLevel() == 0) {
      levelScore = 8;
    } else {
      levelScore = 8;
    }
    return levelScore;
  }
}
