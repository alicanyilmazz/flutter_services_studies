import 'package:flutter/material.dart';
import 'package:flutterstudy/HttpPackageJsonApi/models/httpmodels/post.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteApi extends StatefulWidget {

  String data;
  RemoteApi({Key key, @required this.data}) : super(key: key);

  @override
  _RemoteApiState createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {

  PostPlaceHolder _jsonData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   /* _getThePost().then((value){
      _jsonData=value;
    });*/
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
      body: FutureBuilder(future: _getThePost(), builder: (BuildContext context,AsyncSnapshot<List<PostPlaceHolder>> snapshot){ //snapshot.data dememizin sebebi snapshot da json datası haric networkkden gelen packet bilgileri status code vs de bulunur ondan bu sekilde erişiyoruz.
        if(snapshot.hasData){
            return ListView.builder(itemBuilder: (context,index)=>Card(
              elevation: 4,
              color: Colors.pink.shade50,
              child: ListTile(
                leading: Icon(Icons.person_outline,color: index%2==0 ? Colors.cyan : Colors.pink,),
                title: Text(snapshot.data[index].title),
                subtitle: Text(snapshot.data[index].body),
                trailing: CircleAvatar(
                  child: Text(snapshot.data[index].id.toString()),
                ),
              ),
            ),
              itemCount: snapshot.data.length,
            );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Future<List<PostPlaceHolder>> _getThePost() async{
    var response=await http.get("https://jsonplaceholder.typicode.com/posts");
    if(response.statusCode==200)
    {
      //return PostPlaceHolder.fromJson(json.decode(response.body));
      return (json.decode(response.body) as List).map((singleData) => PostPlaceHolder.fromJson(singleData)).toList();
    }
    else
    {
      throw Exception("Not Connected ${response.statusCode}");
    }
  }

}
