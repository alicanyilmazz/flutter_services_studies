import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/Pokedex/models/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon data;

  PokemonDetail({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          data.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(builder: (context,orientation){
        if(orientation==Orientation.portrait)
        {
           return verticalBody(context);
        }else{
           return horizontalBody(context);
        }
      }),
    );
  }

  Widget horizontalBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-30,
      height: MediaQuery.of(context).size.height*(3/4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: data.img,
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(data.img,fit: BoxFit.contain,),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    data.name,
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + data.height,
                  ),
                  Text(
                    "Weight : " + data.weight,
                  ),
                  Text(
                    "Types : ",
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: data.type
                        .map(
                          (_type) => Chip(
                        backgroundColor: Colors.orangeAccent.shade200,
                        label: Text(
                          _type,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                  Text("Previous Evolution",style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: data.prevEvolution != null
                        ? data.prevEvolution
                        .map(
                          (previousevolution) => Chip(
                        backgroundColor: Colors.orangeAccent.shade200,
                        label: Text(
                          previousevolution.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        .toList()
                        : [Text("First Evolution")],
                  ),
                  Text("Next Evolution",style: TextStyle( fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: data.nextEvolution != null
                        ? data.nextEvolution
                        .map(
                          (evolution) => Chip(
                        backgroundColor: Colors.orangeAccent.shade200,
                        label: Text(
                          evolution.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        .toList()
                        : [Text("Last Evolution")],
                  ),
                  Text("Weakness",style: TextStyle( fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: data.weaknesses != null
                        ? data.weaknesses
                        .map(
                          (weakness) => Chip(
                        backgroundColor: Colors.orangeAccent.shade200,
                        label: Text(
                          weakness,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        .toList()
                        : [Text("There is not any weakness")],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Stack verticalBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  data.name,
                  style: TextStyle( fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height : " + data.height,
                ),
                Text(
                  "Weight : " + data.weight,
                ),
                Text(
                  "Types : ",
                  style: TextStyle( fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data.type
                      .map(
                        (_type) => Chip(
                          backgroundColor: Colors.orangeAccent.shade200,
                          label: Text(
                            _type,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Text("Previous Evolution",style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data.prevEvolution != null
                      ? data.prevEvolution
                      .map(
                        (previousevolution) => Chip(
                      backgroundColor: Colors.orangeAccent.shade200,
                      label: Text(
                        previousevolution.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      .toList()
                      : [Text("First Evolution")],
                ),
                Text("Next Evolution",style: TextStyle( fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data.nextEvolution != null
                      ? data.nextEvolution
                          .map(
                            (evolution) => Chip(
                              backgroundColor: Colors.orangeAccent.shade200,
                              label: Text(
                                evolution.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : [Text("Last Evolution")],
                ),
                Text("Weakness",style: TextStyle( fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data.weaknesses != null
                      ? data.weaknesses
                      .map(
                        (weakness) => Chip(
                      backgroundColor: Colors.orangeAccent.shade200,
                      label: Text(
                        weakness,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      .toList()
                      : [Text("There is not any weakness")],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: data.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                data.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
