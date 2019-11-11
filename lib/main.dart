import 'package:flutter/material.dart';
import './views/layouts/layout_details.dart';
import 'views/layouts/layout_zodiacs.dart';
import './views/layouts/layout_splash.dart';
import "styles.dart";
import "./models/MyAdmob.dart";


const SplashScreen = "/";
const ZodiacsRoute = "/layout_zodiacs";
const ZodiacDetailsRoute = "/layout_details";

void main() {
  initializeAdmob();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      title: 'Astroscope',
      theme: _themeData(),
      
      // LayoutZodiacs()
      // LayoutDetails(),
    );
  }

  ThemeData _themeData(){
    return ThemeData(
          backgroundColor: PrimaryBackColor,
          textTheme: TextTheme(
            title: TitleTextStyle,
            headline: AppBarTitleStyle,
            body1: BodyTextStyle
          ),
      );
  }

  RouteFactory _routes(){
      return (settings){
          final Map<String, dynamic> arguments = settings.arguments;
          Widget screen;
          switch(settings.name){
              case SplashScreen:
                screen = SpashScreen();
              break;
              case ZodiacsRoute:
                screen = LayoutZodiac();
              break;
              case ZodiacDetailsRoute:
                screen = LayoutDetails(zodiacSign: arguments["zodiac"],dateRange: arguments["dateRange"], assetPath: arguments["assetPath"],);
              break;
              default:
                return null;
          }
          return MaterialPageRoute(builder: (BuildContext context)=>screen);
      };
  }
}

 
