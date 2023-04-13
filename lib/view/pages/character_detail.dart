import 'package:flutter/material.dart';
import 'package:marvel_api/view/controller/Character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  final defaultDescription = 'Este personaje no tiene descripción.';

  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  Widget buildButton({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 7),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            )
          ],
        ),
      );
  Widget buildStaticsIcon(IconData icon) => CircleAvatar(
      radius: 25,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Icon(
              icon,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 32,
            ),
          ),
        ),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            'Marvel API',
            style: TextStyle(
              fontFamily: 'Marvel',
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              character.image,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Text(
                character.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(width: 0, color: Color.fromARGB(0, 255, 255, 255)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildButton(text: "Comics", value: character.comicsCount),
                      buildButton(text: "Series", value: character.seriesCount),
                      buildButton(text: "Historias", value: character.storiesCount),
                      buildButton(text: "Eventos", value: character.eventsCount),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Series',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  for (final seriesName in character.firstThreeSeriesNames)
                    Text(
                      seriesName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}