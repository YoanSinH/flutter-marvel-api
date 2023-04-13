import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_api/view/pages/list_characters.dart';

Future<void> loadFont() async {
  await rootBundle.load("assets/fonts/MarvelRegular-Dj83.ttf");
}

class MainApp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainApp1();
  }
}

class _MainApp1 extends State<MainApp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListCharacters(),
    );
  }
}