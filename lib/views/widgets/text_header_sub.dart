import "package:flutter/material.dart";
import "../../models/ZodiacSign.dart";
import "../../styles.dart";



class TextHeaderSub extends StatelessWidget{
  final String _header;
  final String _subHeader;

  TextHeaderSub(this._header, this._subHeader);

  @override
  Widget build(BuildContext context) {
    final zodiac = Zodiac.fetchAll();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
      
          Row(
            children: <Widget>[
              Image.asset(zodiac[5].zodiacSign[0].logo, height: 64.0, width: 64.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: new EdgeInsetsDirectional.only(start: 5.0),
                    child: Text(_header, style: HeaderTextStyle,),
                  ),
                  Container(
                    padding: new EdgeInsetsDirectional.only(start: 10.0),
                    child: Text(_subHeader, style: BodyTextStyle,),
                  )
                  
                ],
              )
            
              
            ],
          )
        
        ],
      );
   
  }
}