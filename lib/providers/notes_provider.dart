import 'package:flutter/cupertino.dart';
import '../models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    readData();
    //Future.delayed(const Duration(seconds: 5));
    //print("notes are:" + getNotes().toString());
  }
  //Notes List
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    //Note note = new Note(8.toString(), 0.toString());
    //_notes.add(note);
    //readData();
    //Future.delayed(const Duration(seconds: 5));
    return _notes;
  }

  Future<void> addData(String title, String descriptions) async {
    /* final Stream<QuerySnapshot> game =
        FirebaseFirestore.instance.collection('admin_memoryGame').snapshots();*/
    Note note = new Note(title, descriptions);

    _notes.add(note);

    notifyListeners();
    CollectionReference users =
        FirebaseFirestore.instance.collection('admin_memory_game');

    // Call the user's CollectionReference to add a new user
    return users
        .doc((_notes.length - 1).toString())
        .set({
          'level': title, // John Doe
          'levelScore': descriptions, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> readData() async {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('admin_memory_game')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Note note =
            new Note(doc["level"].toString(), doc["levelScore"].toString());

        _notes.add(note);

        //_notes.add(doc["level"]);
        //_notes.add(doc["levelScore"]);

        print("title:" + note.title);
        print("description:" + note.description);
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

  Future<void> removeNotes(int index) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('admin_memory_game');
    _notes.removeAt(index);
    notifyListeners();
    return users
        .doc((index).toString())
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  /* Future<void> removeNotes2(int index) async {
    _notes.removeAt(index);
    notifyListeners();
  }*/
}
