import 'package:flutter/material.dart';
import 'package:flutterstudy/HttpPackageJsonApi/Routes/routemanager.dart';
import 'package:flutterstudy/HttpPackageJsonApi/homepage.dart';
import 'package:flutterstudy/errorpage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JSON USING',
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
