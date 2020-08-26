import 'package:flutter/material.dart';
import 'package:flutterstudy/errorpage.dart';
import 'package:flutterstudy/storage/Routes/routemanager.dart';
import 'package:flutterstudy/storage/shared_preferences/homepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences',
      //initialRoute: '/HomePage',
      onGenerateRoute: RouteManager.generateRoute,
      onUnknownRoute: (RouteSettings settings)=>MaterialPageRoute(builder: (context)=>ErrorPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: "Shared Preferences"),
    );
  }
}
