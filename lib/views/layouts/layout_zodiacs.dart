import 'package:astroscope/main.dart';
import 'package:flutter/material.dart';
import '../../models/ZodiacSign.dart';
import '../../styles.dart';
import 'package:admob_flutter/admob_flutter.dart';
import '../../models/MyAdmob.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class LayoutZodiac extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return LayoutZodiacState();
  }
}
class LayoutZodiacState extends State<LayoutZodiac>{
  Future showPopup(BuildContext context, String message, List zodiac) async {
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return  modalPopup(message, zodiac);
      }
    );
  }
  Future<bool> _onWillPop() {
    showInterstitialAd();
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text("Are you sure ?", style: HelpHeaderTextStyle,),
        content: new Text('You are about to exit', style: DetailsSubTextStyle,),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }
  @override
  void dispose() {
    super.dispose();
   disposeInterstitialAd();
  }
  @override
  Widget build(BuildContext context) {
    final zodiac = Zodiac.fetchAll();
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
        children: <Widget>[
        Container(
          constraints:
              BoxConstraints.expand(height: MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [PrimaryBackColor, Colors.black],
                begin: const FractionalOffset(1.0, 1.0),
                end: const FractionalOffset(0.2, 0.2),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        Container(
          margin: new EdgeInsets.only(top: 25.0),
          padding: new EdgeInsets.only(right: 10.0),
          child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                         Icon(Icons.help, color: Colors.white,size: 24.0,),
                         Text("HELP", style: HelpLabelTextStyle,)
                      ],
                    ), 
                    onPressed: (){
                        showPopup(context, "What is my zodiac sign ?", zodiac);
                    },
                  )
                ],
              ),
        ),
        Container(
          margin: new EdgeInsets.only(top: 120.0),
          child: Column(
            children: <Widget>[
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("Tap your zodiac sign", style: HeaderTextStyle2,)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: _imageButtons(3, zodiac, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: _imageButtons(6, zodiac, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: _imageButtons(9, zodiac, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: _imageButtons(12, zodiac, context),
              ),

              Container(
                    padding: new EdgeInsets.only(top: 30.0),
                    child:  AdmobBanner(
                      adUnitId: getBannerAdUnitId(),
                      adSize: AdmobBannerSize.BANNER,
                    ),
              )
            ],
          ),
        )
      ],
    )
    )
    );
  }

  List<Widget> _imageButtons(int counter, List zodiac, BuildContext context) {
    List<Widget> widget = [];
    for (var i = counter - 3; i < counter; i++) {
      widget.add(Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            ClipOval(
              child: Container(
                  height: 64.0,
                  width: 64.0,
                  padding: new EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(zodiac[i].zodiacSign[0].logo))),
                  child: FlatButton(
                    child: null,
                    onPressed: () => _onZodiacTap(
                      context,
                      zodiac[i].zodiacSign[0].logoTitle,
                      zodiac[i].zodiacSign[0].dateRange,
                      zodiac[i].zodiacSign[0].logo,
                    ),
                  )),
            ),
            Text(
              zodiac[i].zodiacSign[0].logoTitle,
              style: BodyTextStyle,
            )
          ],
        ),
      ));
    }
    return widget;
  }

  void _onZodiacTap(
      BuildContext context, String zodiac, String dateRange, String assetPath) {
    Navigator.pushNamed(context, ZodiacDetailsRoute, arguments: {
      "zodiac": zodiac,
      "dateRange": dateRange,
      "assetPath": assetPath
    });
  }

  Widget modalPopup(String message, List zodiac){
    return AlertDialog(
        title: Text(message, style: HelpHeaderTextStyle),
        content: Container(
          constraints: BoxConstraints.expand(height: 240.0),
          child: SingleChildScrollView(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getHoroscopes(zodiac),
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getDateRange(zodiac),
              )
              
            ],
          ),
          )
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () =>  Navigator.pop(context),
            child: Text("Okay, I got it !"),
          )
        ],
      );
  }


  List<Widget> getHoroscopes(List zodiac){
      List<Widget> widget = [];
      widget.add(
        Container(
          margin: new EdgeInsets.only(bottom: 5.0),
          child: Text("Zodiac Sign".toUpperCase(), style: HelpTitleTextStyle),
        )
        );
      for(var i = 0; i<zodiac.length; i++){
        widget.add(
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Row(
                  children: <Widget>[ 
                     Image.asset(zodiac[i].zodiacSign[0].logo, height: 16.0, width: 16.0,),
              Text(zodiac[i].zodiacSign[0].logoTitle, style: HelpSubTextStyle)],
                ),
              )
            ],
          )
          );
      }
      return widget;
  }

   List<Widget> getDateRange(List zodiac){
      List<Widget> widget = [];
      widget.add(
        Container(
          margin: new EdgeInsets.only(bottom: 5.0),
          child: Text("Birth Date Range".toUpperCase(), style: HelpTitleTextStyle)
        )
        );
      for(var i = 0; i<zodiac.length; i++){
        widget.add(
          Padding(
            padding: EdgeInsets.only(bottom: 3.0),
            child: Text(zodiac[i].zodiacSign[0].shortDateRange, style: HelpSubTextStyle),
          )
          );
      }
      return widget;
  }
}
