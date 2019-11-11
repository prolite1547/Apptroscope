import 'package:flutter/material.dart';
import 'dart:async';

class Popup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return PopupState();
  }
}

class PopupState extends State<Popup>{
  Future showPopup(BuildContext context, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return  AlertDialog(
        title: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () =>  Navigator.pop(context),
            child: Text("Okay, I got it !"),
          )
        ],
      );
      }
    );
  }
   Widget build(BuildContext context) {
   
    return null;
  }
}