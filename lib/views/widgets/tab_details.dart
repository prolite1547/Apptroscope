import 'package:flutter/material.dart';
import '../../styles.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(currentDate, style: DetailsTitleTextStyle),
        Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(description, style: DetailsSubTextStyle),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Compatibility:  ", style: DetailsTitleTextStyle),
              Text(
                compatibility,
                style: DetailsSubTextStyle,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Mood:  ", style: DetailsTitleTextStyle),
              Text(
                mood,
                style: DetailsSubTextStyle,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Lucky Color:  ", style: DetailsTitleTextStyle),
              Text(
                color,
                style: DetailsSubTextStyle,
              )
            ],
          ),
        ),
         Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Lucky Number:  ", style: DetailsTitleTextStyle),
              Text(
                luckyNumber,
                style: DetailsSubTextStyle,
              )
            ],
          ),
        ),
         Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Time of Luck:  ", style: DetailsTitleTextStyle),
              Text(
                luckyTime,
                style: DetailsSubTextStyle,
              )
            ],
          ),
        )
      ],
    );
  }
}
