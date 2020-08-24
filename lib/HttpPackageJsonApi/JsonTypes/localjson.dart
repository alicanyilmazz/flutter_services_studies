import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterstudy/HttpPackageJsonApi/models/cars.dart';

class LocalJson extends StatefulWidget {

  String data;
  LocalJson({Key key, @required this.data}) : super(key: key);

  @override
  _LocalJsonState createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  List<Cars> cars;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cars = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB TIKLANDI");
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          Icons.access_alarm,
          size: 24.0,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: readLocalDataSourceJson(context),
            builder: (context, result) {
              if (result.hasData) {
                cars = result.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cars[index].carName.toString()),
                      subtitle: Text(cars[index].country.toString()),
                    );
                  },
                  itemCount: cars.length,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<List<Cars>> readLocalDataSourceJson(BuildContext context) async {
    var readJson = await DefaultAssetBundle.of(context)
        .loadString('assets/data/json/car.json');
    List<Cars> cars = (json.decode(readJson) as List)
        .map((mapStructure) => Cars.fromJson(mapStructure))
        .toList();

    return cars;
  }
}
