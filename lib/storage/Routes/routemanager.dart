import 'package:flutter/material.dart';
import 'package:flutterstudy/errorpage.dart';
import 'package:flutterstudy/storage/shared_preferences/homepage.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/HomePage':
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
        /*
      case '/pokemondetail':
        {
          if (args != null && args is String) {
            return MaterialPageRoute(
              builder: (_) => PokemonDetail(
                data: args,
              ),
            );
          }
          return null;
        }*/

      default:
        {
          return MaterialPageRoute(builder: (_) => ErrorPage());
        }
    }
  }
}
