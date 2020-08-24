import 'package:flutter/material.dart';
import 'dart:convert';

class BasicLocalJson extends StatefulWidget {

  String data;
  BasicLocalJson({Key key,@required this.data}):super(key:key);


  @override
  _BasicLocalJsonState createState() => _BasicLocalJsonState();
}

class _BasicLocalJsonState extends State<BasicLocalJson> {
  List cars;

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
        child: FutureBuilder(future:readLocalDataSource(context) ,builder: (context,result){

          if(result.hasData){
            cars=result.data;
            return ListView.builder(
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(cars[index]["car_name"]),
                  subtitle: Text(cars[index]["country"]),
                );
              },
              itemCount: cars.length,
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

Future<List> readLocalDataSource(BuildContext context) async {
  var readJson = await DefaultAssetBundle.of(context).loadString('assets/data/json/car.json');
  var carLists = json.decode(readJson.toString());
  return carLists;

}
