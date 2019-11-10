import 'package:flutter/material.dart';
import '../../styles.dart';
import 'package:share/share.dart';

class TabDetails extends StatelessWidget {
  final String currentDate;
  final String description;
  final String compatibility;
  final String mood;
  final String color;
  final String luckyNumber;
  final String luckyTime;

  TabDetails(this.currentDate, this.description, this.compatibility, this.mood,
      this.color, this.luckyNumber, this.luckyTime);

  @override
  Widget build(BuildContext context) {
    String sharedText = currentDate + "\n" + description + "\n\n" + "Compatibility : "+ compatibility + "\n" + "Mood : "+ mood + "\n"+" Lucky Color : "+ color + "\n"+ "Lucky number : "+ luckyNumber + "\n"+ "Time of luck : "+ luckyTime;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(currentDate, style: DetailsTitleTextStyle),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Text(description, style: DetailsSubTextStyle),
        ),
        Container(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Compatibility:  ", style: DetailsTitleTextStyle),
                        Padding(
                            padding: new EdgeInsets.only(top: 5.0),
                            child:
                                Text("Mood:  ", style: DetailsTitleTextStyle)),
                        Padding(
                            padding: new EdgeInsets.only(top: 5.0),
                            child: Text("Lucky Color:  ",
                                style: DetailsTitleTextStyle)),
                        Padding(
                          padding: new EdgeInsets.only(top: 5.0),
                          child: Text("Lucky Number:  ",
                              style: DetailsTitleTextStyle),
                        ),
                        Padding(
                          padding: new EdgeInsets.only(top: 5.0),
                          child: Text("Time of Luck:  ",
                              style: DetailsTitleTextStyle),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          compatibility,
                          style: DetailsSubTextStyle,
                        ),
                        Padding(
                          padding: new EdgeInsets.only(top: 5.0),
                          child: Text(
                            mood,
                            style: DetailsSubTextStyle,
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.only(top: 5.0),
                          child: Text(
                            color,
                            style: DetailsSubTextStyle,
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.only(top: 5.0),
                          child: Text(luckyNumber, style: DetailsSubTextStyle),
                        ),
                        Padding(
                          padding: new EdgeInsets.only(top: 5.0),
                          child: Text(luckyTime, style: DetailsSubTextStyle),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      tooltip: "Share this content",
                      backgroundColor: DetailsBackColor,
                      child: Icon(Icons.share),
                      onPressed: ()=>Share.share(sharedText),
                    )
                   
                  ],
                )
              ],
            )),
      ],
    );
  }
}
