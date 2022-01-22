import 'package:flutter/cupertino.dart';
import '../models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NotesProvider extends ChangeNotifier {
  //Notes List
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
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
        .add({
          'level': title, // John Doe
          'levelScore': descriptions, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

// function to add data to list of notes
  /*Future<void> addNotes(String title, String descriptions) async {
    Note note = new Note(title, descriptions);

    _notes.add(note);

    notifyListeners();
  }*/

  // function to remove or delete notes by using list index position
  //CollectionReference users = FirebaseFirestore.instance.collection('admin_memory_game');

  Future<void> removeNotes(int index) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('admin_memory_game');
    _notes.removeAt(index);
    notifyListeners();
    return users
        .doc("nGZpDZ4lJkIcLeVCp9R3")
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  /*void removeNotes(int index) {

    _notes.removeAt(index);
    notifyListeners();
  }*/
}
