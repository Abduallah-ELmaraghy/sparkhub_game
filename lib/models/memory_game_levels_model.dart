import 'package:flutter/material.dart';

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
}
