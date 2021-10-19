import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedox_app/screens/pokemon_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokedex;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: Text(
                'Pokedex',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: pokedex.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: InkWell(
                                  child: SafeArea(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: pokedex[index]['type'][0] ==
                                                  "Grass"
                                              ? Colors.green.shade900
                                              : pokedex[index]['type'][0] ==
                                                      "Fire"
                                                  ? Colors.red.shade900
                                                  : pokedex[index]['type'][0] ==
                                                          "Water"
                                                      ? Colors.blue.shade900
                                                      : pokedex[index]['type']
                                                                  [0] ==
                                                              "Poison"
                                                          ? Colors
                                                              .deepPurple.shade900
                                                          : pokedex[index]['type']
                                                                      [0] ==
                                                                  "Electric"
                                                              ? Colors.amber.shade900
                                                              : pokedex[index]['type']
                                                                          [0] ==
                                                                      "Rock"
                                                                  ? Colors.grey.shade900
                                                                  : pokedex[index]['type']
                                                                              [
                                                                              0] ==
                                                                          "Ground"
                                                                      ? Colors
                                                                          .brown.shade900
                                                                      : pokedex[index]['type'][0] ==
                                                                              "Psychic"
                                                                          ? Colors.indigo.shade900
                                                                          : pokedex[index]['type'][0] == "Fighting"
                                                                              ? Colors.orange.shade900
                                                                              : pokedex[index]['type'][0] == "Bug"
                                                                                  ? Colors.lightGreenAccent.shade700
                                                                                  : pokedex[index]['type'][0] == "Ghost"
                                                                                      ? Colors.deepPurple.shade900
                                                                                      : pokedex[index]['type'][0] == "Normal"
                                                                                          ? Colors.black26
                                                                                          : Colors.pink.shade900,
                                          borderRadius: const BorderRadius.all(Radius.circular(25))),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: -10,
                                            right: -10,
                                            child: Image.asset(
                                              'images/pokeball.png',
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Hero(
                                              tag: index,
                                              child: CachedNetworkImage(
                                                  imageUrl: pokedex[index]
                                                      ['img'],
                                                  height: 100,
                                                  fit: BoxFit.fitHeight,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )),
                                            ),
                                          ),
                                          Positioned(
                                            top: 55,
                                            left: 15,
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  pokedex[index]['type'][0],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      shadows: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.blueGrey,
                                                            offset:
                                                                Offset(0, 0),
                                                            spreadRadius: 1.0,
                                                            blurRadius: 15)
                                                      ]),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                          ),
                                          Positioned(
                                            top: 30,
                                            left: 15,
                                            child: Text(
                                              pokedex[index]['name'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  shadows: [
                                                    BoxShadow(
                                                        color: Colors.blueGrey,
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 1.0,
                                                        blurRadius: 15)
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailScreen(
                                                  heroTag: index,
                                                  pokemonDetail: pokedex[index],
                                                  color: pokedex[index]['type']
                                                              [0] ==
                                                          "Grass"
                                                      ? Colors.green.shade700
                                                      : pokedex[index]['type']
                                                                  [0] ==
                                                              "Fire"
                                                          ? Colors.red.shade900
                                                          : pokedex[index]['type']
                                                                      [0] ==
                                                                  "Water"
                                                              ? Colors.blue.shade900
                                                              : pokedex[index]['type']
                                                                          [0] ==
                                                                      "Poison"
                                                                  ? Colors
                                                                      .deepPurpleAccent.shade700
                                                                  : pokedex[index]['type'][0] ==
                                                                          "Electric"
                                                                      ? Colors
                                                                          .amber.shade900
                                                                      : pokedex[index]['type'][0] ==
                                                                              "Rock"
                                                                          ? Colors
                                                                              .grey.shade900
                                                                          : pokedex[index]['type'][0] == "Ground"
                                                                              ? Colors.brown.shade900
                                                                              : pokedex[index]['type'][0] == "Psychic"
                                                                                  ? Colors.indigo.shade900
                                                                                  : pokedex[index]['type'][0] == "Fighting"
                                                                                      ? Colors.orange.shade900
                                                                                      : pokedex[index]['type'][0] == "Bug"
                                                                                          ? Colors.lightGreenAccent.shade700
                                                                                          : pokedex[index]['type'][0] == "Ghost"
                                                                                              ? Colors.deepPurple.shade900
                                                                                              : pokedex[index]['type'][0] == "Normal"
                                                                                                  ? Colors.white70
                                                                                                  : Colors.pink.shade900,
                                                ),),);
                                  },
                                ),
                              );
                            },),)
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 150,
              width: width,
            ),
          ),
        ],),);
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body);
        pokedex = data['pokemon'];

        setState(() {});

        
      }
    }).catchError((e) {
      print(e);
    });
  }
}
