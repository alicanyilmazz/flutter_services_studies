import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String name;
  int id;
  bool gender;
  var formKey = GlobalKey<FormState>();
  var _sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_sharedPreferences=SharedPreferences.getInstance().then((sfp) => _sharedPreferences=sfp);
    SharedPreferences.getInstance().then((sfp) {
      _sharedPreferences = sfp;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_sharedPreferences.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (val) {
                  name = val;
                },
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (val) {
                  id = int.parse(val);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Identity",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile(
                value: true,
                groupValue: gender,
                onChanged: (selected) {
                  setState(() {
                    gender = selected;
                  });
                },
                title: Text("Man"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile(
                value: false,
                groupValue: gender,
                onChanged: (selected) {
                  setState(() {
                    gender = selected;
                  });
                },
                title: Text("Woman"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: _add,
                  child: Text(
                    "Save",
                  ),
                  color: Colors.lightGreenAccent,
                ),
                RaisedButton(
                  onPressed: _show,
                  child: Text(
                    "Show",
                  ),
                  color: Colors.orangeAccent,
                ),
                RaisedButton(
                  onPressed: _delete,
                  child: Text(
                    "Delete",
                  ),
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _add() async {
    formKey.currentState.save();
    await (_sharedPreferences as SharedPreferences).setString("name", name);
    await (_sharedPreferences as SharedPreferences).setInt("id", id);
    await (_sharedPreferences as SharedPreferences).setBool("gender", gender);
  }

  void _show() {
    debugPrint("Readed name : " +
            (_sharedPreferences as SharedPreferences).getString("name") ??
        "not available");
    debugPrint("Readed id : " +
            (_sharedPreferences as SharedPreferences).getInt("id").toString() ??
        "not available");
    debugPrint("Readed gender : " +
            (_sharedPreferences as SharedPreferences)
                .getBool("gender")
                .toString() ??
        "not available");
  }

  void _delete() {
    (_sharedPreferences as SharedPreferences).remove("name");
    (_sharedPreferences as SharedPreferences).remove("id");
    (_sharedPreferences as SharedPreferences).remove("gender");
  }
}
