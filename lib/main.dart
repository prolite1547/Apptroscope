import 'package:flutter/material.dart';
import './views/layouts/layout_details.dart';
import 'views/layouts/layout_zodiacs.dart';
import "styles.dart";


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: PrimaryBackColor,
          textTheme: TextTheme(
            title: TitleTextStyle,
            headline: AppBarTitleStyle,
            body1: BodyTextStyle
          ),
      ),
      home:  LayoutDetails(),
    );
  }
}

 
