import 'package:flutter/material.dart';

class Details {
  int level = 0;
  int noOfstar = 1;
  Details();

  void setSelectedlevel(int lev) {
    this.level = lev;
  }

  int getSelctedLevel() {
    return this.level;
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}
