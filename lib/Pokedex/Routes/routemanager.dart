import 'package:flutter/material.dart';
import 'package:flutterstudy/Pokedex/homepage.dart';
import 'package:flutterstudy/Pokedex/models/pokedex.dart';
import 'package:flutterstudy/Pokedex/pokemon_detail.dart';
import 'package:flutterstudy/errorpage.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/HomePage':
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case '/pokemondetail':
        {
          if (args != null && args is Pokemon) {
            return MaterialPageRoute(
              builder: (_) => PokemonDetail(
                data: args,
              ),
            );
          }
          return null;
        }

      default:
        {
          return MaterialPageRoute(builder: (_) => ErrorPage());
        }
    }
  }
}
