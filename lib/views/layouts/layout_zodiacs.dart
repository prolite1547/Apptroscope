import 'package:astroscope/main.dart';
import 'package:flutter/material.dart';
import '../../models/ZodiacSign.dart';
import '../../styles.dart';
import 'package:admob_flutter/admob_flutter.dart';
import '../../models/MyAdmob.dart';

class LayoutZodiacs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zodiac = Zodiac.fetchAll();

    return Scaffold(
        body: Stack(
        children: <Widget>[
        Container(
          constraints:
              BoxConstraints.expand(height: MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [DetailsBackColor, Colors.blueGrey],
                begin: const FractionalOffset(1.0, 1.0),
                end: const FractionalOffset(0.2, 0.2),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
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
}
