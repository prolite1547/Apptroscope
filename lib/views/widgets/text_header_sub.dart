import "package:flutter/material.dart";
import "../../models/ZodiacSign.dart";
import "../../styles.dart";



class TextHeaderSub extends StatelessWidget{
  final String _header;
  final String _subHeader;
  final String _assetPath;


  TextHeaderSub(this._header, this._subHeader, this._assetPath);

  @override
  Widget build(BuildContext context) {
 
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
      
          Row(
            children: <Widget>[
              Image.asset(_assetPath, height: 64.0, width: 64.0,),
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