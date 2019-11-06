import 'package:flutter/material.dart';
import '../../models/ZodiacSign.dart';
import '../../styles.dart';

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
          margin: new EdgeInsets.only(top: 150.0),
          child:  Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: _imageButtons(3, zodiac),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: _imageButtons(6, zodiac),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: _imageButtons(9, zodiac),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: _imageButtons(12, zodiac),
            ),
          ],
        ),)
      ],
    ));
  }

  List<Widget> _imageButtons(int counter, List zodiac) {
    List<Widget> widget = [];
    for (var i = counter - 3; i < counter; i++) {
      widget.add(Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            Image.asset(zodiac[i].zodiacSign[0].logo,
            height: 64.0, width: 64.0),
            Text(zodiac[i].zodiacSign[0].logoTitle, style: BodyTextStyle,)
          ],
        ),
      ));
    }
    return widget;
  }
}
