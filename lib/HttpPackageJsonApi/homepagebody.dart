import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("BasicLocalJson"),
              color: Colors.pink,
              onPressed: (){
                Navigator.pushNamed(context, "/basiclocaljson",arguments: "");
              },
            ),
            RaisedButton(
              child: Text("LocalJson"),
              color: Colors.brown,
              onPressed: (){
                Navigator.pushNamed(context, "/localjson",arguments: "asd");
              },
            ),
            RaisedButton(
              child: Text("HttpJson"),
              color: Colors.orange,
              onPressed: (){
                Navigator.pushNamed(context, "/remoteapi",arguments: "");
              },
            ),
          ],
        ),
      ),
    );
  }
}
