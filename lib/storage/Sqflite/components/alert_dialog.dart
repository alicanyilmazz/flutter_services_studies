import 'package:flutter/material.dart';

// Default Alert Dialog
Future<bool> showAlertDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text("Confirm"),
        content: const Text("Are you sure you wish to delete this item?"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("DELETE")
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
        ],
      );
    },
  );
}

// Custom Alert Dialog
Future<bool> showCustomAlertDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 200,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Are you sure you wish to delete this item?",
                  ),
                ),
                SizedBox(
                  width: 320.0,
                  child: RaisedButton(
                    color: Color(0xFF1BC0C5),
                    onPressed: (){},
                    child: Text("Confirm",style: TextStyle(color:Colors.white,),),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Designed Alert Dialog
Future<bool> showCustomDesignAlertDialog({BuildContext context,String title,String description,String buttonText,String image}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 100,
                  bottom: 16,
                  left: 16,
                  right: 16
              ),
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow:[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0,10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w700),),
                  SizedBox(height: 16.0,),
                  Text(description,style: TextStyle(fontSize: 16.0),),
                  SizedBox(height: 24.0,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text("Confirm",style: TextStyle(color: Colors.pink),),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 80,
              right: 16,
              child: Container(
                child: Image(image: AssetImage("assets/images/gif/$image"),width: 150,height: 150,),
              ),
            ),
          ],
        ),
      );
    },
  );
}
/*
CircleAvatar(
backgroundColor: Colors.blueAccent,
radius: 100,
backgroundImage: AssetImage("assets/images/gif/$image"),
)

*/
