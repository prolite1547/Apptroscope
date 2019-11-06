import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../../../models/Horoscope.dart';
import '../../widgets/tab_details.dart';
import 'dart:convert';

class Tab1 extends StatefulWidget {
  final String day;
  Tab1(this.day);
  @override
  State<StatefulWidget> createState() {
    return Tab1State(day);
  }
}

class Tab1State extends State<Tab1> {
  final String _day; 
  Tab1State(this._day);

  Future<Horoscope> getData(String day) async {
    var response = await http.post(
        Uri.encodeFull(
            "https://aztro.sameerkumar.website/?sign=virgo&day="+day),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    Horoscope horoscope = new Horoscope.fromJson(data);
    return horoscope;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
            FutureBuilder(
              future: getData(_day),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Text("Predicting your fortune..", style: TextStyle(color: Colors.black),);
                }else{
                   return TabDetails(snapshot.data.currentdate, snapshot.data.description, snapshot.data.compatibility, snapshot.data.mood, snapshot.data.color, snapshot.data.luckynumber, snapshot.data.luckytime);
                }
               
              },
            )
        ],
      ),
    );
  }
}
