import "package:flutter/material.dart";
import "../../styles.dart";

class TextHeaderSub extends StatefulWidget {
  final String _header;
  final String _subHeader;
  final String _assetPath;

  TextHeaderSub(this._header, this._subHeader, this._assetPath);
  @override
    State<StatefulWidget> createState() {
      return _TextHeaderSub(_header, _subHeader, _assetPath);
    }
  }

class _TextHeaderSub extends State<TextHeaderSub>{
    String _header;
    String _subHeader;
    String _assetPath;
    bool _isReminded = false;

    _TextHeaderSub(this._header, this._subHeader, this._assetPath);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Image.asset(
              _assetPath,
              height: 64.0,
              width: 64.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.only(left: 5.0),
                  child: Text(
                    _header,
                    style: HeaderTextStyle,
                  ),
                ),
                Container(
                  padding: new EdgeInsets.only(left: 7.0),
                  child: Text(
                    _subHeader,
                    style: BodyTextStyle,
                  ),
                ),
               
              ],
            )
                ],
              ),
            ),
            Expanded(
              flex:  1,
              child:  Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){
                              
                        },
                        child: Icon(Icons.more_vert, color: Colors.white,),
                    )
                  ],
                )
              ),
            )
          ],
        )
      ],
    );
  }

  Widget popupMenu(){
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context)=><PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "one_val",
          child: Text("ONE VALUE"),
        )
      ],
    );
  }
}
