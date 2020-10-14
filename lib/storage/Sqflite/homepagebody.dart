import 'package:flutter/material.dart';
import 'package:flutterstudy/storage/Sqflite/helpers/databasehelper.dart';
import 'package:flutterstudy/storage/Sqflite/models/student.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text(
                "Product List",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
              onPressed: () {
                Navigator.pushNamed(context, "/productlist", arguments: "");
              },
            ),
          ],
        ),
      ),
    );
  }
}
