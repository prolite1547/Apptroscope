
import "package:flutter/material.dart";
import "../../styles.dart";
import 'package:custom_switch/custom_switch.dart';
import '../../models/Notif.dart';
import '../../models/SharedPref.dart';

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

class _TextHeaderSub extends State<TextHeaderSub> {
  String _header;
  String _subHeader;
  String _assetPath;
  bool _isReminded = false;
  Notif notif = Notif();
  SharedPref sharedPref = SharedPref();

  _TextHeaderSub(this._header, this._subHeader, this._assetPath);

  @override
  void initState() {
    super.initState();
    notif.initializeNotif(context);
  }

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
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Daily Reminder ",
                        style: BodyTextStyle,
                      ),
                    ),
                    FutureBuilder(
                      future: sharedPref.getReminder(),
                      initialData: false,
                      builder: (context, snapshot) {
                        return CustomSwitch(
                          value: snapshot.data,
                          onChanged: (value) {
                            sharedPref.setReminder(value);
                            if (value) {
                              // notif.runDailyTimeNotif();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                      "Daily reminder has been set for zodiac $_header"),
                                ),
                              ));
                            } else {
                              notif.cancellAllNotif();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Daily reminder has been removed in zodiac $_header"),
                              ));
                            }
                          },
                          activeColor: Color.fromRGBO(39, 174, 96, 1.0),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget popupMenu() {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "one_val",
          child: Text("ONE VALUE"),
        )
      ],
    );
  }
}
