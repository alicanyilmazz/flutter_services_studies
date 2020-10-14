import 'package:flutter/material.dart';
import 'package:flutterstudy/errorpage.dart';
import 'package:flutterstudy/storage/Routes/routing.dart';
import 'package:flutterstudy/storage/Sqflite/helpers/databasehelper.dart';
import 'package:flutterstudy/storage/Sqflite/homepage.dart';

class MyApp extends StatelessWidget {

  DatabaseHelper _databaseHelper=DatabaseHelper();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sqflite',
      //initialRoute: '/HomePage',
      onGenerateRoute: RoutingManager.generateRoute,
      onUnknownRoute: (RouteSettings settings)=>MaterialPageRoute(builder: (context)=>ErrorPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: "Sqflite"),
    );
  }
}
