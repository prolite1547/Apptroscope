import "package:flutter/material.dart";
import "../../styles.dart";



class TextHeaderSub extends StatelessWidget{
  final String _header;
  final String _subHeader;

  TextHeaderSub(this._header, this._subHeader);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
      
          Row(
            children: <Widget>[
              Image.asset("assets/images/zodiac/virgo.png", height: 64.0, width: 64.0,),
              Column(
                children: <Widget>[
                  Container(
                    padding: new EdgeInsetsDirectional.only(start: 5.0),
                    child: Text(_header, style: HeaderTextStyle,),
                  ),
                  Container(
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