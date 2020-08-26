import 'package:flutter/material.dart';
import 'package:flutterstudy/Pokedex/models/pokedex.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex _pokedex;
  Future<Pokedex> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<Pokedex> comedPokedex) {
                if (comedPokedex.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (comedPokedex.connectionState ==
                    ConnectionState.done) {
                  /*return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(comedPokedex.data.pokemon[index].name);
                  });*/
                  return GridView.count(
                    crossAxisCount: 2,
                    children: comedPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/pokemondetail",
                              arguments: poke);
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            elevation: 6,
                            child: Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/images/gif/FadingCube.gif",
                                        image: poke.img),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  throw Exception("Opps there is a error.");
                }
              });
        } else {
          return FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<Pokedex> comedPokedex) {
                if (comedPokedex.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (comedPokedex.connectionState ==
                    ConnectionState.done) {
                  /*return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(comedPokedex.data.pokemon[index].name);
                  });*/
                  return GridView.extent(
                    maxCrossAxisExtent: 300,
                    children: comedPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/pokemondetail",
                              arguments: poke);
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: FadeInImage.assetNetwork(
                                      placeholder:
                                          "assets/images/gif/FadingCube.gif",
                                      image: poke.img),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  throw Exception("Opps there is a error.");
                }
              });
        }
      },
    );
  }

  Future<Pokedex> getPokemon() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    _pokedex = Pokedex.fromJson(decodedJson);
    return _pokedex;
  }
}
