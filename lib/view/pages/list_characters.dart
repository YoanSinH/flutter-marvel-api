import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api/view/pages/character_detail.dart';
import 'package:marvel_api/view/widgets/character_tile.dart';

import '../controller/Character.dart';

class ListCharacters extends StatefulWidget {
  @override
  _ListCharactersState createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  List<dynamic> characters = [];

  Future<void> getCharacters() async {
    final ts = '777';
    final apiKey = '74c324c13a2e56f8b4fb566670323a52';
    final hash = '617ce5a9ca1b7a43e1433175f5d561c8';

    final url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$apiKey&hash=$hash&limit=50&offset=500';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        characters = jsonData['data']['results'];
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  void _showCharacterDetail(int index) {
    final character = characters[index];
    final name = character['name'];
    final thumbnail = character['thumbnail']['path'] +
        '.' +
        character['thumbnail']['extension'];
    final description = character['description'];
    // Validación para cuando description sea nulo o esté vacío
    final defaultDescription = 'Este personaje no tiene descripción.';
    final validDescription = (description == null || description.isEmpty)
        ? defaultDescription
        : description;
    final comics = character['comics']['available'];
    final series = character['series']['available'];
    final stories = character['stories']['available'];
    final events = character['events']['available'];
    final List<dynamic> seriesList = character['series']['items'];
    final seriesCount = min(seriesList.length, 3); // Validación para seriesList
    final List<String> seriesNames = seriesList
        .sublist(0, seriesCount)
        .map((item) => item['name'].toString())
        .toList();
    final Character selectedCharacter = Character(
        name: name,
        image: thumbnail,
        thumbnail: thumbnail,
        description: validDescription,
        comicsCount: comics,
        seriesCount: series,
        storiesCount: stories,
        eventsCount: events,
        firstThreeSeriesNames: seriesNames);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CharacterDetails(
                character: selectedCharacter,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.black,
        
      ),
      body: Center(
        child: characters.isEmpty
            ? CircularProgressIndicator()
            : GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  final thumbnail = character['thumbnail']['path'] +
                      '.' +
                      character['thumbnail']['extension'];
                  final name = character['name'];
                  return GestureDetector(
                      onTap: () {
                        _showCharacterDetail(index);
                      },
                      child: CharacterTile(
                        character: characters[index],
                        onTap: () {
                          _showCharacterDetail(index);
                        },
                      ));
                },
              ),
      ),
    );
  }
}