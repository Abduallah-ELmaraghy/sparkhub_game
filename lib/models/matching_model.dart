import 'package:flutter/material.dart';

class Matching {
 late String? id;
 late String? color;
 late String? emoji;
  final Map choices = {
    '🦞': Colors.red,
    '🌳': Colors.green,
    '🥶': Colors.blue,
    '🍋': Colors.yellow,
    '🏀': Colors.orange,
    '💜': Colors.purple,
  };
    

 Matching({this.id,this.color,this.emoji});

 
  factory Matching.fromJson(Map<String, dynamic> json) {
    return Matching(
      id: json['id'],
      color: json['data']['color'],
      emoji: json['data']['emoji'],
    );
  
  }

}
