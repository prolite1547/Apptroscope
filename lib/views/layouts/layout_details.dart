import 'dart:async';

import 'package:astroscope/styles.dart';
import "package:flutter/material.dart";
import "../widgets/text_header_sub.dart";
import "../widgets/section_tab.dart";
import 'package:admob_flutter/admob_flutter.dart';
import '../../models/MyAdmob.dart';
import '../../models/Notif.dart';

class LayoutDetails extends StatefulWidget{
  final String zodiacSign;
  final String dateRange;
  final String assetPath;
  LayoutDetails({this.zodiacSign, this.dateRange, this.assetPath});

  @override
  State<StatefulWidget> createState() {
     return _LayoutDetailState(zodiacSign: zodiacSign, dateRange: dateRange, assetPath: assetPath);
  }
}


class _LayoutDetailState extends State<LayoutDetails>{
    String zodiacSign;
    String dateRange;
    String assetPath; 
    var notif = new Notif();
    _LayoutDetailState({this.zodiacSign, this.dateRange, this.assetPath});

@override
  void initState() {
     super.initState();
     notif.initializeNotif(context);
     notif.runDailyTimeNotif();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     title: Center(
      //       child: Text(
      //         "Astroscope".toUpperCase(),
      //         style: Theme.of(context).textTheme.headline,
      //       ),
      //     ),
      //     backgroundColor: Theme.of(context).backgroundColor),
       
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height),
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [PrimaryBackColor, Colors.black],
                      begin: const FractionalOffset(1.0, 1.0),
                      end: const FractionalOffset(0.2, 0.2),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Container(
                      constraints: BoxConstraints.expand(height: 100.0),
                      margin: new EdgeInsets.only(
                          top: 25.0, left: 20.0, right: 20.0),
                      child: TextHeaderSub(
                          zodiacSign.toUpperCase(), dateRange, assetPath)),
                  Container(
                    constraints: BoxConstraints.expand(
                        height: MediaQuery.of(context).size.height - 230.0),
                    margin:
                        new EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          new BoxShadow(
                            color: DetailsBackColor,
                            blurRadius: 15.0,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SectionTab(
                          zodiac: zodiacSign.toLowerCase(),
                        )
                      ],
                    ),
                  ),

                  Container(
                    padding: new EdgeInsets.symmetric(vertical: 10.0),
                    child:  AdmobBanner(
                      adUnitId: getBannerAdUnitId(),
                      adSize: AdmobBannerSize.BANNER,
                    ),
                  )
                 
                ],
              )
            ],
          )
          // Container(
          //   constraints: BoxConstraints.expand(height: 300.0),
          //   child: Stack(
          //     children: <Widget>[
          //       ImageBanner(assetPath: "assets/images/virgo.jpg",),
          //       TextHeaderSub("Virgo", "AUG to SEPT")
          //     ],
          //   ),
          // ),
          // SectionTab()
        ],
      ),
    );
  }
}
