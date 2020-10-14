import 'package:flutter/material.dart';

void callSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Item Deleted."),backgroundColor: Colors.black));
}