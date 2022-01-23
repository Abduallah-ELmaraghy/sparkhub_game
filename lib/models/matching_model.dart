import 'package:flutter/material.dart';

class Matching {
 final String id;
  final Map choices;
    

 Matching({required this.id,required this.choices});

 
  factory Matching.fromJson(Map<String, dynamic> json) {
    return Matching(
      id: json['id'],
      choices: json['data']['choices'],
    );
  
  }

}
