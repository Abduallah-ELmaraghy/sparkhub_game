import 'package:http/http.dart' as http;
import 'dart:convert';

class Note {
  String title;
  String description;

  Note(this.title, this.description);
}
