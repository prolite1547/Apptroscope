import 'dart:async';

import 'package:flutter/material.dart';
import '../../styles.dart';
import '../../main.dart';
class SpashScreen extends StatefulWidget{
@override
  State<StatefulWidget> createState() {
     return _SplashScreenState();
  }
}



class _SplashScreenState extends State <SpashScreen> {
@override
  void initState() {
     super.initState();
     Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, ZodiacsRoute);

     });
  }

  @override
  void dispose() {
     super.dispose();
  }




  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Stack(
         fit: StackFit.expand,
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [PrimaryBackColor, Colors.black],
                begin: const FractionalOffset(1.0, 1.0),
                end: const FractionalOffset(0.2, 0.2),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          )
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Expanded(
                 flex: 2,
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Container(
                         constraints: BoxConstraints.expand(height:220.0, width: 250.0),
                          child: Image.asset("assets/images/logo.png", fit: BoxFit.contain),
                       )

                      //  CircleAvatar(
                      //    backgroundColor: Colors.white,
                      //    radius: 50.0,
                      //    child: Icon(Icons.group_work, size: 36.0,color:Colors.black),
                      //  ),
                      //  Padding(padding: EdgeInsets.only(top:20.0),),
                      //  Text("Astroscope", style: HeaderTextStyle,)
                     ],
                   ),
                 ),
               ),

               Expanded(
                 flex: 1,
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       CircularProgressIndicator(backgroundColor: DetailsBackColor,),
                       Padding(padding: EdgeInsets.only(top: 10.0),),
                       Text("Preparing your horoscope ..", style: TextStyle(
                         fontFamily: RalewayFontFamily,
                         fontSize: RegularFontSize,
                         fontWeight: FontWeight.w300,
                         color: Colors.white
                       ),)
                     ],
                   ),
                 ),
               )
             ],
           )
         ],
       ),
     );
  }
}