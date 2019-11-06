import 'package:flutter/material.dart';
import '../../styles.dart';

class LayoutZodiacs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height),
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
                child: Row(
                  children: <Widget>[
                      Image.asset("assets/images/zodiac/aries.png", height: 30.0, width: 30.0,)
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
