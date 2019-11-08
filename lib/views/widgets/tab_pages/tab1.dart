import 'package:flutter/material.dart';
import '../../../models/ZodiacApi.dart' as zodiac_api;
import '../../widgets/tab_details.dart';
 

class Tab1 extends StatefulWidget {
  final String day;
  final String zodiac;

  Tab1(this.day, this.zodiac);
  @override
  State<StatefulWidget> createState() {
    return Tab1State(day, zodiac);
  }
}

class Tab1State extends State<Tab1> {
  String _day; 
  String _zodiac;

  Tab1State(this._day, this._zodiac);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: new EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
      child: Column(
        children: <Widget>[
            FutureBuilder(
              future: zodiac_api.getData(_day, _zodiac),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Text("Predicting your fortune..", style: TextStyle(color: Colors.black),);
                }else{
                   return TabDetails(snapshot.data.currentdate, snapshot.data.description, snapshot.data.compatibility, snapshot.data.mood, snapshot.data.color, snapshot.data.luckynumber, snapshot.data.luckytime);
                }
               
              },
            )
        ],
      )
     );
  }
}
