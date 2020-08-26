import 'package:flutter/material.dart';
import 'package:flutterstudy/Pokedex/Routes/routemanager.dart';
import 'package:flutterstudy/Pokedex/homepage.dart';
import 'package:flutterstudy/errorpage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      //initialRoute: '/HomePage',
      onGenerateRoute: RouteManager.generateRoute,
      onUnknownRoute: (RouteSettings settings)=>MaterialPageRoute(builder: (context)=>ErrorPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: "Study"),
    );
  }
}
