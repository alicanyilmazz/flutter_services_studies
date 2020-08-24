import 'package:flutter/material.dart';
import 'package:flutterstudy/HttpPackageJsonApi/JsonTypes/basiclocaljson.dart';
import 'package:flutterstudy/HttpPackageJsonApi/JsonTypes/httpjson.dart';
import 'package:flutterstudy/HttpPackageJsonApi/JsonTypes/localjson.dart';
import 'package:flutterstudy/HttpPackageJsonApi/homepage.dart';
import 'package:flutterstudy/errorpage.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/HomePage':
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case '/basiclocaljson':
        {
          if (args != null && args is String) {
            return MaterialPageRoute(
              builder: (_) => BasicLocalJson(
                data: args,
              ),
            );
          }
          return null;
        }
      case '/localjson':
        {
          if (args != null && args is String) {
            return MaterialPageRoute(
              builder: (_) => LocalJson(
                data: args,
              ),
            );
          }
          return null;
        }
      case '/remoteapi':
        {
          if (args != null && args is String) {
            return MaterialPageRoute(
              builder: (_) => RemoteApi(
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
