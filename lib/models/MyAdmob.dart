import 'package:admob_flutter/admob_flutter.dart';

void initializeAdmob(){
   Admob.initialize(getAppId());
}

String getAppId(){
  return "ca-app-pub-5781720751858381~9674785637";
}

String getBannerAdUnitId(){
  return "ca-app-pub-3940256099942544/6300978111";
}

String getInterstitialAdUnitId(){
  return "ca-app-pub-3940256099942544/1033173712";
}