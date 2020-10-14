import 'package:flutter/material.dart';

Widget createBasicChip({String label,Color ,Color color,String text}){
  return Container(
    margin: EdgeInsets.all(6.0),
    child: Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade600,
        child: Text(text),
      ),
      label: Text(label,style: TextStyle(color: Colors.white),),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor:Colors.grey[60] ,
      padding: EdgeInsets.all(6.0),
    ),
  );
}

Widget createAdvanceChip({String label,Color color,String text}){
  return Container(
    margin: EdgeInsets.all(6.0),
    child: Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.teal.shade200,
        child: Text(text,style: TextStyle(fontSize: 12,color: Colors.white),),
      ),
      label: Icon(Icons.attach_money),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor:Colors.grey[60] ,
      padding: EdgeInsets.all(6.0),
    ),
  );
}