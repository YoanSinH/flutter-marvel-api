import 'package:flutter/material.dart';
import 'package:marvel_api/view/main_app.dart';
import 'package:marvel_api/view/pages/detail_character.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel API",
      home: MainApp1(),
      routes: {'detail_character': (context) => DetailCharacter()},
    );
  }
}
