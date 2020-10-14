import 'package:flutter/material.dart';
import 'package:flutterstudy/storage/Sqflite/homepage.dart';
import 'package:flutterstudy/storage/Sqflite/models/product.dart';
import 'package:flutterstudy/storage/Sqflite/screens/product_add.dart';
import 'package:flutterstudy/storage/Sqflite/screens/product_detail.dart';
import 'package:flutterstudy/storage/Sqflite/screens/product_edit.dart';
import 'package:flutterstudy/storage/Sqflite/screens/product_list.dart';
import '../../errorpage.dart';

class RoutingManager {
  static Route<bool> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/HomePage':
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case '/addproduct':
        {
          if (args != null && args is String) {
            return MaterialPageRoute(
              builder: (_) => ProductAdd(
                data: args,
              ),
            );
          }
          return null;
        }
      case '/productlist':
        {
          if (args != null && args is String) {
            return MaterialPageRoute(
              builder: (_) => ProductList(
                data: args,
              ),
            );
          }
          return null;
        }
      case '/productdetail':
        {
          if (args != null && args is Product) {
            return MaterialPageRoute(
              builder: (_) => ProductDetail(
                product: args,
              ),
            );
          }
          return null;
        }
      case '/productedit':
        {
          if (args != null && args is Product) {
            return MaterialPageRoute(
              builder: (_) => ProductEdit(
                product: args,
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
