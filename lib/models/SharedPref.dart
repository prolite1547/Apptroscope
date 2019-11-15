import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPref {
   
  setZodiac(String value) async{
   SharedPreferences sharedPref  = await SharedPreferences.getInstance();
   sharedPref.setString('zodiac', value);
  }

  Future<String> getZodiac() async{
    SharedPreferences sharedPref  = await SharedPreferences.getInstance();
    return sharedPref.getString('zodiac');
  }

  setReminder(bool isReminded) async{
    SharedPreferences sharedPref  = await SharedPreferences.getInstance();
    sharedPref.setBool('isReminded', isReminded);
  }

  Future<bool> getReminder() async{
    SharedPreferences sharedPref  = await SharedPreferences.getInstance();
    return sharedPref.getBool('isReminded');
  }
}
